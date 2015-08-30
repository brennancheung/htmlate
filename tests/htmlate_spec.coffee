Htmlate = require('../lib/htmlate')
$ = require 'cheerio'

chai    = require 'chai'
expect  = chai.expect

describe 'plain HTML', ->

    it 'should output the same HTML if there are not dynamic parts', ->
        html = '<html><body><span id="test">hello from html</span></body></html>'
        htmlate = new Htmlate html
        expect(htmlate.render()).to.equal html


describe 'directives', ->
    describe 'tags', ->
        it 'should allow simple replacements', ->
            html = '<html><body><custom/></body></html>'
            htmlate = new Htmlate html
            htmlate.directive 'custom',
                restrict: 'E'
                replace: (element) ->
                    $("<div>I am some custom text</div>")
            # htmlate.directive 'foo',
                # restrict: 'C'
                # compile: (element) ->
                    # element
            # htmlate.directive 'cms-bind',
                # restrict: 'A'
                # compile: (element) ->
                    # element

            htmlate.compile()
            expect(htmlate.render()).to.equal '<html><body><div>I am some custom text</div></body></html>'
            

describe 'interpolation', ->
    it 'should interpolate text inside a tag'
    it 'should interpolate text inside an attribute'

