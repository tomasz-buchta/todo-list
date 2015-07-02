controllers = angular.module('todoer')
controllers.controller 'UserSessionsCtrl', ['$scope','Auth',($scope,Auth)->
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
    ,
      (error) ->
        alert 'authentication failed'
    )

    $scope.$on('devise:login', ((event,currentUser) ->
      console.log 'devise:login'
      )
    )
]