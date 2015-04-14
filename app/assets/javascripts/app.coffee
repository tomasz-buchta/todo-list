todoer = angular.module('todoer',[
  'templates',
  'ngRoute',
  'controllers',
])



todoer.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'TodosController'
      )
])

controllers = angular.module('controllers',[])
#todos = [
#  {
#    id: 1
#    name: 'Baked Potato w/ Cheese'
#  },
#  {
#    id: 2
#    name: 'Garlic Mashed Potatoes',
#  },
#  {
#    id: 3
#    name: 'Potatoes Au Gratin',
#  },
#  {
#    id: 4
#    name: 'Baked Brussel Sprouts'
#  },
#]
#controllers.controller("TodosConroller", [ '$scope', '$routeParams', '$location',->
#
#])
controllers.controller 'TodosController',['$scope','$http',($scope,$http)->
  $http.get('../todos.json').success((data)->
    $scope.todos = data
  )
]

todoer.factory('Todos',['$resource',($resource)->
  $resource('/todos.json',{},{
    query: {method: 'GET',isArray: true}
  })
])
