controllers = angular.module('controllers',[])
controllers.controller 'TodosController',['$scope','Todo',($scope,Todo)->
  $scope.todos = Todo.query()
  $scope.orderProp = 'title'
]