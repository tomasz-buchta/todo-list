controllers = angular.module('todoer')
controllers.controller 'UserSessionsCtrl', ['$scope','Auth','$state',($scope,Auth,$state)->
  credentials = {
    email: '',
    password: ''
  }
  config = {
    headers: {
      'X-HTTP-Method-Override': 'POST'
    }
  }
  $scope.login = (credentials) ->
    Auth.login(credentials,config).then( (user) ->
      $scope.currentUser = Auth.currentUser()
      $state.go('index')
    ,
      (error) ->
        alert 'authentication failed'
    )
]
controllers.controller 'UserSignOutCtrl', ['$scope','Auth',($scope,Auth)->
    Auth.logout().then((oldUser)->
      alert 'Logged out'
    ,
    (error)->
      alert 'Error'
  )
]
controllers.controller 'UserCtrl',['$state','$scope','Auth',($state,$scope,Auth)->
  $scope.$on('devise:login',((event,currentUser)->
    $scope.currentUser = currentUser
    $scope.isAuthenticated = Auth.isAuthenticated()
  ))
  $scope.$on('devise:logout',((event,oldUser)->
    $scope.currentUser = null
    $scope.isAuthenticated = Auth.isAuthenticated()
  ))
]