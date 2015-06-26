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

    $stateProvider
      .state('index', {
        url: '/',
        templateUrl: "list.html",
        controller: 'TodoCtrl'})

    $urlRouterProvider.otherwise('/')

#    $locationProvider.html5Mode(true)
])
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
