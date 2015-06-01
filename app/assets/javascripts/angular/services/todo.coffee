todoerServices = angular.module('services',['ngResource'])

todoerServices.factory('Todo',['$resource',($resource)->
  $resource('../todos/:Id.json',{Id:"@Id"},{
    query: {method:'GET', isArray:true}
    get: {method:'GET', isArray:false}
    update: {method: 'PUT'}
    save: {method: 'POST'}
  })
])