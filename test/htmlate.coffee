htmlate = require('../lib/htmlate')
should = require('should')
jsdom = require('jsdom')

delay = (ms, fn) -> setTimeout fn, ms

describe 'security', ->
  html = "<html><head><script type='text/javascript'>" +
             'document.getElementById("test").innerHTML = "hello from javascript";' +
             "</script></head>" +
             "<body><span id='test'>hello from html</span></body></html>"

  it 'should run scripts if we do not explicitly disable them', ->
    # We don't really need this test but it might help us catch something if jsdom
    # changes its security model.
    doc = jsdom.jsdom html
    doc.getElementById('test').innerHTML.should.equal('hello from javascript')

  it 'should not run scripts in htmlate', ->
    hlate = new htmlate(html)
    dom = hlate.getDOM()
    dom.getElementById('test').innerHTML.should.equal 'hello from html'


describe 'getDOM', ->
  it 'should parse the HTML and create a DOM', ->
    html = '<div id="foo">foo div</div><div id="bar">bar div</div>'
    hlate = new htmlate(html)
    dom = hlate.getDOM()
    debugger
    dom.getElementById('foo').innerHTML.should.equal 'foo div'
    dom.getElementById('bar').innerHTML.should.equal 'bar div'

describe 'rendering', ->
  it 'should render the HTML'
    # html = '<div id="foo">foo div</div><div id="bar">bar div</div>'
    # dom = new htmlate(html).getDOM()
    # dom.innerHTML.should.equal html
