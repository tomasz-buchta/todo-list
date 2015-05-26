controllers = angular.module('controllers',[])
controllers.controller 'TodoDetailCtrl',['$scope','Todo',($scope,Todo)->
  $scope.orderProp = 'title'
  $scope.todos = Todo.query()
]