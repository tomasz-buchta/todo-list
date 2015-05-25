angular.module('todoer').factory('Todo', ->
  $resource('/todos/:id')
)