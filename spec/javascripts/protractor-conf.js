require('coffee-script/register');
exports.config = {
    allScriptsTimeout: 11000,

    specs: [
        'e2e/*.coffee'
    ],

    capabilities: {
        'browserName': 'chrome'
    },

    chromeOnly: true,

    baseUrl: 'http://localhost:3000/angular/index',

    framework: 'jasmine',

    jasmineNodeOpts: {
        defaultTimeoutInterval: 30000
    }
};