controllers = angular.module('controllers',[])
controllers.controller 'TodosController',['$scope','$http',($scope,$http)->
  $http.get('../todos.json').success((data)->
    $scope.todos = data
  )
  $scope.orderProp = 'title'
]