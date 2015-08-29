class Htmlate
    constructor: (html, context={})->
        @context = context
        @html = html
        @tags = {}

    # tag handler takes the form function(element, attributes)
    registerTag: (tag, handler) ->
        @tags[tag] = handler

    render: ->
        @html

module.exports = Htmlate
