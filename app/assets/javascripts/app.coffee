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
