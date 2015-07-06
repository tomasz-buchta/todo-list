todoer = angular.module('todoer',[
  'ui.router',
  'templates',
  'controllers',
  'ngResource',
  'services',
  'ngAnimate',
  'ngFx',
  'Devise',
  'angular-flash.service',
  'angular-flash.flash-alert-directive',
  'alertService'
])

todoer.config([ '$stateProvider','$urlRouterProvider','flashProvider'
  ($stateProvider,$urlRouterProvider,flashProvider)->

    $stateProvider
      .state('index', {
        url: '/todos',
        templateUrl: "list.html",
        controller: 'TodoCtrl',
      })
      .state('new', {
        url: '/todos/new',
        templateUrl: 'new.html',
        controller: 'TodoNewCtrl',
        authenticate: true
      })
      .state('detail', {
        url: '/todos/:Id',
        templateUrl: 'detail.html',
        controller: 'TodoDetailCtrl'
      })
      .state('edit',{
        url: '/todos/:Id/edit',
        templateUrl: 'edit.html',
        controller: 'TodoEditCtrl',
        authenticate: true
      })
      .state('sign_in',{
        url: '/user/sign_in'
        templateUrl: 'user_sessions/new.html'
        controller: 'UserSessionsCtrl'
      })
      .state('sign_out',{
        controller: 'UserSignOutCtrl'
      })
    $urlRouterProvider.otherwise('/todos')

    $urlRouterProvider.html5Mode = true

    flashProvider.errorClassnames.push('alert')
    flashProvider.successClassnames.push('success')
    flashProvider.warnClassnames.push('warning')
    flashProvider.infoClassnames.push('info')

])
todoer.run(['$rootScope','$state','$timeout','Auth',($rootScope,$state,$timeout,Auth)->
  $rootScope.$on('$stateChangeStart',(event,toState,toStateParams,flash)->
    $rootScope.toState = toState
    $rootScope.toStateParams = toStateParams

    flash.message = 'test'
    if toState.authenticate
      unless Auth.isAuthenticated()
        $timeout(->
          $state.go('sign_in'))
  )
  $rootScope.$on('devise:logout',((event,oldUser)->
    $state.go('index')
  ))
])