controllers = angular.module('controllers',[])
controllers.controller 'TodoCtrl',['$scope','Todo',($scope,Todo)->
  $scope.orderProp = 'title'
  $scope.todos = Todo.query()
]
controllers.controller 'TodoDetailCtrl',['$scope','$routeParams','Todo',($scope,$routeParams,Todo)->
  $scope.todo = Todo.get({Id:$routeParams.Id})
]
controllers.controller 'TodoNewCtrl',['$scope','Todo',($scope,Todo) ->
  todo = $scope.todo = Todo.get({Id:'new'})
  $scope.addTodo = ->
    Todo.save($scope.todo)
]