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
        templateUrl: "list.html"
        controller: 'TodoCtrl'
      )
      .when('/todos/new',
        templateUrl: 'new.html'
        controller:  'TodoNewCtrl'
      )
      .when('/todos/:Id',
        templateUrl: "detail.html"
        controller: "TodoDetailCtrl"
      )
      .otherwise(
        redirectTo: '/todos'
    )
])
