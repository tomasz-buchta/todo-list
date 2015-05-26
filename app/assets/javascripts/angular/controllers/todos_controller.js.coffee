controllers = angular.module('controllers',[])
controllers.controller 'TodoCtrl',['$scope','Todo',($scope,Todo)->
  $scope.orderProp = 'title'
  $scope.todos = Todo.query()
]