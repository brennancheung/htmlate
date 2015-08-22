Htmlate = require('../lib/htmlate')
chai    = require 'chai'
expect  = chai.expect

describe 'plain HTML', ->
    html = "<html><body><span id='test'>hello from html</span></body></html>"

    it 'should output the same HTML if there are not dynamic parts', ->
        htmlate = new Htmlate html
        expect(htmlate.render()).to.equal html
