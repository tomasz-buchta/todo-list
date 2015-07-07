angular.module('user',[])

.config(['$stateProvider',($stateProvider)->
    $stateProvider
      .state('users',{
        url: '/users'
        templateUrl: "index.html"
        controller: 'UserCtrl'
      }
    )
])

.controller('UserCtrl',['$scope',($scope)->
  $scope.users = {email: 'one'}
])