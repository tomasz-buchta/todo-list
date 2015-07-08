angular.module('user',[])

.config(['$stateProvider',($stateProvider)->
    $stateProvider
      .state('users',{
        url: '/users'
        templateUrl: "angular/modules/user/user-list.html"
        controller: 'UserListCtrl'
      })
      .state('user-profile',{
        url: '/users/:Id'
        templateUrl: 'angular/modules/user/profile.html'
        controller: 'UserProfileCtrl'
      })
])

.controller('UserListCtrl',['$scope','User',($scope,User)->
    console.log 'test'
    $scope.users = User.query()
])
.controller('UserProfileCtrl',['$scope','$stateParams','User',($scope,$stateParams,User)->
    console.log 'profile ctrl'
    $scope.user = User.get({Id:$stateParams.Id})
])