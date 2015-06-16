todoer = angular.module('todoer',[
  'ngRoute',
  'templates',
  'controllers',
  'ngResource',
  'services',
  'ngAnimate',
  'ngFx',
  'ng-token-auth',
])



todoer.config([ '$routeProvider','$httpProvider',
  ($routeProvider,$httpProvider)->
    $routeProvider
      .when('/todos',
        templateUrl: "list.html"
        controller: 'TodoCtrl'
      )
      .when('/sign_in',
        templateUrl: 'user_sessions/new.html'
        controller: 'UserSessionsCtrl'
      )
      .when('/todos/new',
        templateUrl: 'new.html'
        controller:  'TodoNewCtrl'
      )
      .when('/todos/:Id',
        templateUrl: "detail.html"
        controller: "TodoDetailCtrl"
      )
      .when('/todos/:Id/edit',
        templateUrl: 'edit.html'
        controller:  'TodoEditCtrl'
      )
      .otherwise(
        redirectTo: '/todos'
    )
    $httpProvider.defaults.headers.common['X-CSRF-Token'] =
      $("meta[name='csrf-token']").attr('content')
])
