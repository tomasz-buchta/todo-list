describe('todoer controllers', function() {

    beforeEach(module('todoer'));

    describe('TodosController', function(){
        var scope, ctrl, $httpBackend;



        beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
            $httpBackend = _$httpBackend_;
            $httpBackend.expectGET('../todos.json').
                respond([{title: 'todo 2'}]);

            scope = $rootScope.$new();
            ctrl = $controller('TodosController', {$scope: scope});
        }));

        it('should set the todo', function() {
            expect(scope.todos).toBeUndefined();
            $httpBackend.flush();
            expect(scope.todos).toEqual([{title: 'todo 2'}]);
        });
    });
});
