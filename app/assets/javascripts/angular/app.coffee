todoer = angular.module('todoer',[
  'ngRoute',
  'templates',
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
