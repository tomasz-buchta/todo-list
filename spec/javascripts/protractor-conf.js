require('coffee-script');
exports.config = {
    allScriptsTimeout: 11000,

    specs: [
        'e2e/*.coffee'
    ],

    capabilities: {
        'browserName': 'chrome'
    },

    chromeOnly: true,
    baseUrl: 'http://localhost:3001/angular/index',

    framework: 'jasmine',

    jasmineNodeOpts: {
        defaultTimeoutInterval: 30000
    }
};