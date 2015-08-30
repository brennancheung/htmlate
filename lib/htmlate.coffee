cheerio = require 'cheerio'
class Htmlate
    constructor: (html, context={})->
        @context = context
        @$ = cheerio.load html
        @tags = {}
        @classes = {}
        @attributes = {}

    directive: (name, definition) ->
        throw "definition not found" unless definition
        @tags[name] = definition       if /E/.test definition.restrict
        @classes[name] = definition    if /C/.test definition.restrict
        @attributes[name] = definition if /A/.test definition.restrict

    processDirective: (directive, element) ->
        if directive.replace
            newElement = directive.replace(element)[0]
            $ = cheerio(element).replaceWith newElement
        if directive.compile
            directive.compile element

    processAttrDirective: (directive, element, attr) ->
        return
        if directive.replace
            element.replace directive.replace element
        if directive.compile
            directive.compile element

    walk: (node) ->
        switch node.type
            when 'tag'
                if @tags[node.name]
                    @processDirective @tags[node.name], node
                for key, value of node.attribs
                    if key is 'class'
                        classes = node.attribs.class.split(" ").filter (c) -> !!c
                        for klazz in classes
                            if @classes[klazz]
                                @processDirective @tags[node.name], node
                    if @attributes[key]
                        @processAttrDirective @tags[node.name], node, value
                for child in node.children
                    @walk child
            when 'text'
                console.log "#{node.type}: #{node.data}"
            else
                console.log node

    compile: ->
        @walk @$("html")[0]

    render: ->
        @$.html()

module.exports = Htmlate
