todoer = angular.module('todoer',[
  'templates',
  'ngRoute',
  'controllers',
])



todoer.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'TodosController'
      )
])

controllers = angular.module('controllers',[])
