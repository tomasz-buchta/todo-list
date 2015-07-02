controllers = angular.module('controllers',[])
controllers.controller 'TodoCtrl',['$scope','Todo','Auth',($scope,Todo,Auth)->
  $scope.orderProp = 'title'
  $scope.todos = Todo.query()
  $scope.deleteTodo = (id) ->
    if confirm "Are you sure?"
      Todo.delete(Id: id,->
        $scope.todos = Todo.query()
      )

]
controllers.controller 'TodoDetailCtrl',['$scope','$stateParams','Todo',($scope,$stateParams,Todo)->
  $scope.todo = Todo.get({Id:$stateParams.Id})
]
controllers.controller 'TodoNewCtrl',['$scope','Todo',($scope,Todo) ->
  todo = $scope.todo = Todo.get({Id:'new'})
  $scope.addTodo = ->
    Todo.save($scope.todo)
]
controllers.controller 'TodoEditCtrl',['$scope','$stateParams','Todo',($scope,$stateParams,Todo)->
  todo = $scope.todo = Todo.get({Id:$stateParams.Id})
  $scope.updateTodo = ->
    Todo.update(todo: $scope.todo,Id:$stateParams.Id)
]