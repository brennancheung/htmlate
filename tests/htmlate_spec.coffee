Htmlate = require('../lib/htmlate')
chai    = require 'chai'
expect  = chai.expect

describe 'plain HTML', ->

    it 'should output the same HTML if there are not dynamic parts', ->
        html = "<html><body><span id='test'>hello from html</span></body></html>"
        htmlate = new Htmlate html
        expect(htmlate.render()).to.equal html


describe 'tags', ->
    it 'should recognize custom tag handlers', ->
        html = "<html><body><div id='test'><custom/></body></html>"
        htmlate = new Htmlate html
        htmlate.registerTag 'custom', (element, attrs) ->
            replace: true
            root: "<div>I am some custom text</div>"
        expect(htmlate.render()).to.equal "<html><body><div id='test'><div>I am some custom text</div></body></html>"
            

describe 'interpolation', ->
    it 'should interpolate text inside a tag'
    it 'should interpolate text inside an attribute'

