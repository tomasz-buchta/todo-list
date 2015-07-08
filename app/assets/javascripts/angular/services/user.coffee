todoerServices = angular.module('services.user',['ngResource'])

todoerServices.factory('User',['$resource',($resource)->
  $resource('../users/:Id.json',{Id:"@Id"},{
    query: {method:'GET', isArray:true}
    get: {method:'GET', isArray:false}
    update: {method: 'PUT'}
    save: {method: 'POST'}
  })
])