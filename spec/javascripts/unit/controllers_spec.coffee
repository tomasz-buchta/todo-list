describe 'todoer controllers', ->
  beforeEach ->
    @addMatchers toEqualData: (expected) ->
      angular.equals @actual, expected

  beforeEach module('todoer')

  describe 'TodoCtrl', ->
    $httpBackend = undefined
    scope = undefined
    ctrl = undefined

    beforeEach inject((_$httpBackend_, $rootScope, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.whenGET('list.html').respond {}
      $httpBackend.expectGET('../todos.json').respond [ { title: 'todo 2' } ]
      scope = $rootScope.$new()
      ctrl = $controller('TodoCtrl', $scope: scope)
    )

    it 'should set the todo', ->
      expect(scope.todos).toEqualData([])
      $httpBackend.flush()
      expect(scope.todos).toEqualData [ { title: 'todo 2' } ]

    it 'should set the default value for orderProp', ->
      expect(scope.orderProp).toBe 'title'

  describe 'TodoDetailCtrl', ->

    $httpBackend = undefined
    scope = undefined
    ctrl = undefined

    beforeEach inject((_$httpBackend_, $rootScope, $stateParams, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.whenGET('list.html').respond {}
      $httpBackend.expectGET('../todos/123.json').respond todoData()
      $stateParams.Id = '123'
      scope = $rootScope.$new()
      ctrl = $controller('TodoDetailCtrl', $scope: scope)
    )

    todoData = ->
      {
        id: 123
        title: 'Test todo',
        completion: 20,
        description: 'Test description'
      }

    it 'should fetch todo detail', ->
      expect(scope.todo).toEqualData({})
      $httpBackend.flush()
      expect(scope.todo).toEqualData(todoData())

  describe 'TodoNewCtrl', ->

    $httpBackend = undefined
    scope = undefined
    ctrl = undefined

    newTodo = ->
      {"_id":{"$oid":"558d42c7706f6c32730c0000"},
      "completion":null,"created_at":"2015-06-26T12:17:11.000Z",
      "description":null,
      "title":null,
      "updated_at":null}

    beforeEach inject((_$httpBackend_, $rootScope, $stateParams, $controller) ->
      $httpBackend = _$httpBackend_
      $httpBackend.whenGET('list.html').respond {}
      $httpBackend.expectGET('../todos/new.json').respond newTodo()
      scope = $rootScope.$new()
      ctrl = $controller('TodoNewCtrl', $scope: scope)
    )
    it 'should fetch new todo', ->
      expect(scope.todo).toEqualData({})
      $httpBackend.flush()
      expect(scope.todo).toEqualData(newTodo())


