todoer = angular.module('todoer',[
  'ui.router',
  'templates',
  'controllers',
  'ngResource',
  'services',
  'ngAnimate',
  'ngFx',
  'Devise'
])

todoer.config([ '$stateProvider','$urlRouterProvider',
  ($stateProvider,$urlRouterProvider)->
    $urlRouterProvider.otherwise('todos')

    $stateProvider
      .state('todos',
        url: '/index'
        templateUrl: "templates/list.html"
        controller: 'TodoCtrl'
      )
#      .when('/todos/new',
#        templateUrl: 'new.html'
#        controller:  'TodoNewCtrl'
#      )
#      .when('/todos/:Id',
#        templateUrl: "detail.html"
#        controller: "TodoDetailCtrl"
#      )
#      .when('/todos/:Id/edit',
#        templateUrl: 'edit.html'
#        controller:  'TodoEditCtrl'
#      )
#      .when('/user/sign_in',
#        templateUrl: 'user_sessions/new.html'
#        controller: 'UserSessionsCtrl'
#      )
#      .otherwise(
#        redirectTo: '/todos'
#    )
])

#todoer.config([ '$routeProvider','$httpProvider',
#  ($routeProvider,$httpProvider)->
#    $routeProvider
#      .when('/todos',
#        templateUrl: "list.html"
#        controller: 'TodoCtrl'
#      )
#      .when('/todos/new',
#        templateUrl: 'new.html'
#        controller:  'TodoNewCtrl'
#      )
#      .when('/todos/:Id',
#        templateUrl: "detail.html"
#        controller: "TodoDetailCtrl"
#      )
#      .when('/todos/:Id/edit',
#        templateUrl: 'edit.html'
#        controller:  'TodoEditCtrl'
#      )
#      .when('/user/sign_in',
#        templateUrl: 'user_sessions/new.html'
#        controller: 'UserSessionsCtrl'
#      )
#      .otherwise(
#        redirectTo: '/todos'
#    )
#])
