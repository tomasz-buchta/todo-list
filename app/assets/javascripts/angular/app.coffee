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
      .when('/todos',
        templateUrl: "index.html"
        controller: 'TodoCtrl'
      )
      .when('/todos/:Id',
        templateUrl: "todo.html"
        controller: "TodoDetailCtrl"
      )
      .otherwise(
        redirectTo: '/todos'
    )
])
