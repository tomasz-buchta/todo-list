controllers = angular.module('todoer')
controllers.controller 'UserSessionsCtrl', ['$scope','Auth','$state','Alert',($scope,Auth,$state,Alert)->
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
        Alert.error 'Authentication failed'
    )
]
controllers.controller 'UserSignOutCtrl', ['$scope','Auth','Alert',($scope,Auth,Alert)->
    Auth.logout().then((oldUser)->
      Alert.success('User signed out')
    ,
    (error)->
      Alert.error('Error with authentication')
  )
]
controllers.controller 'UserCtrl',['$state','$scope','Auth','Alert',($state,$scope,Auth,Alert)->
  $scope.$on('devise:login',((event,currentUser)->
    $scope.currentUser = currentUser
    Alert.success('User signed in')
    $scope.isAuthenticated = Auth.isAuthenticated()
  ))
  $scope.$on('devise:logout',((event,oldUser)->
    $scope.currentUser = null
    $scope.isAuthenticated = Auth.isAuthenticated()
  ))
]