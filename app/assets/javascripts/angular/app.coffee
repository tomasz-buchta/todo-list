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
        url: '/todos',
        templateUrl: "list.html",
        controller: 'TodoCtrl'
      })
      .state('new', {
        url: '/todos/new',
        templateUrl: 'new.html',
        controller: 'TodoNewCtrl'
      })
      .state('detail', {
        url: '/todos/:Id',
        templateUrl: 'detail.html',
        controller: 'TodoDetailCtrl'
      })
      .state('edit',{
        url: '/todos/:Id/edit',
        templateUrl: 'edit.html',
        controller: 'TodoEditCtrl'
      })
    $urlRouterProvider.otherwise('/todos')

    $urlRouterProvider.html5Mode = true
])
