class Htmlate
    constructor: (html, context={})->
        @context = context
        @html = html

    render: ->
        @html

module.exports = Htmlate
