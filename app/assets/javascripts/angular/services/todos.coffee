todoerServices = angular.module('services',['ngResource'])

todoerServices.factory('Todo',['$resource',($resource)->
  $resource('../todos/:todoId.json',{},{
    query: {method:'GET', params:{todoId:''}, isArray:true}
  })
])