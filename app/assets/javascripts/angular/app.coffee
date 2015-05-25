todoer = angular.module('todoer',[
  'ngRoute',
  'templates',
  'controllers',
  'ngResource',
  'services'
])



todoer.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'TodosController'
      )
])
