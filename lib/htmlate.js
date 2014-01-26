var jsdom = require('jsdom');

module.exports = function(html) {
    var secureFeatures = {features: {FetchExternalResources: false, ProcessExternalResources: false}};
    this.dom = jsdom.jsdom(html, null, secureFeatures);
    this.getDOM = function() { return this.dom; }
};
