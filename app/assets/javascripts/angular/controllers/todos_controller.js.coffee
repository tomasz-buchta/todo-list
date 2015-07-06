controllers = angular.module('controllers',[])
controllers.controller 'TodoCtrl',['$scope','Todo','Auth','SweetAlert',($scope,Todo,Auth,SweetAlert)->
  $scope.orderProp = 'title'
  $scope.todos = Todo.query()
  $scope.deleteTodo = (id) ->

    SweetAlert.swal({
      type: 'warning'
      title: 'Are you sure?'
      text: 'This cannot be undone'
      showCancelButton: true
      },
      
      (isConfirm)->
        if isConfirm
          Todo.delete(Id: id,->
            $scope.todos = Todo.query()
          )
    )
]
controllers.controller 'TodoDetailCtrl',['$scope','$stateParams','Todo',($scope,$stateParams,Todo)->
  $scope.todo = Todo.get({Id:$stateParams.Id})
]
controllers.controller 'TodoNewCtrl',['$scope','Todo','Auth','$state',($scope,Todo,Auth,$state) ->
  todo = $scope.todo = Todo.get({Id:'new'})
  $scope.addTodo = ->
    Auth.currentUser().then((user)->
      $scope.todo.user_id = user._id.$oid
      Todo.save($scope.todo)
      $state.go('index')
    )
]
controllers.controller 'TodoEditCtrl',['$scope','$stateParams','Todo',($scope,$stateParams,Todo)->
  todo = $scope.todo = Todo.get({Id:$stateParams.Id})
  $scope.updateTodo = ->
    Todo.update(todo: $scope.todo,Id:$stateParams.Id)
]