todoerServices = angular.module('services',['ngResource'])

todoerServices.factory('Todo',['$resource',($resource)->
  $resource('../todos/:Id.json',{Id:"@Id"},{
    query: {method:'GET', params:{Id:''}, isArray:true},
    update: {method: 'PUT'}
  })
])