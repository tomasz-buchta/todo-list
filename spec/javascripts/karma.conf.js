module.exports = function(config){
    config.set({
        basePath : '../../',
        preprocessors: {
            '**/*.coffee': ['coffee'],
            '**/*.html' : ['ng-html2js']
        },
        coffeePreprocessor: {
            // options passed to the coffee compiler
            options: {
                bare: true,
                sourceMap: false
            },
            // transforming the filenames
            transformPath: function(path) {
                return path.replace(/\.coffee$/, '.js');
            }
        },
        ngHtml2JsPreprocessor: {
            // we want all templates to be loaded in the same module called 'templates'
            moduleName: 'templates'
        },


        files : [
            'vendor/assets/bower_components/angular/angular.js',
            'vendor/assets/bower_components/angular-route/angular-route.js',
            'vendor/assets/bower_components/angular-mocks/angular-mocks.js',
            'app/assets/javascripts/angular/**/*.coffee',
            'app/assets/javascripts/templates/**/*.html',
            'spec/javascripts/unit/**/*.js'
        ],

        autoWatch : true,

        frameworks: ['jasmine'],

        browsers : ['Chrome'],

        plugins : [
            'karma-chrome-launcher',
            'karma-firefox-launcher',
            'karma-jasmine',
            'karma-coffee-preprocessor',
            'karma-ng-html2js-preprocessor'
        ],

        junitReporter : {
            outputFile: 'test_out/unit.xml',
            suite: 'unit'
        }

    });
};