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
      .state('sign_in',{
        url: '/user/sign_in',
        templateUrl: 'user_sessions/new.html'
        controller: 'UserSessionsCtrl'
      })
    $urlRouterProvider.otherwise('/todos')

    $urlRouterProvider.html5Mode = true
])
todoer.run(['$rootScope','$state','Auth',($rootScope,$state,Auth)->
  $rootScope.$on('$stateChangeStart',(event,toState,toStateParams)->
    $rootScope.toState = toState
    $rootScope.toStateParams = toStateParams
    user = Auth.currentUser().then((user)->
      console.log(user)
    ,
    (error)->
      console.log 'error'
    )
  )

])