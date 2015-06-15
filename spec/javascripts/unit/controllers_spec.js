describe('todoer controllers', function() {

    beforeEach(function(){
        this.addMatchers({
            toEqualData: function(expected) {
                return angular.equals(this.actual, expected);
            }
        });
    });

    beforeEach(module('todoer'));

    describe('TodoCtrl', function(){
        var scope, ctrl, $httpBackend;



        beforeEach(inject(function(_$httpBackend_, $rootScope, $controller) {
            $httpBackend = _$httpBackend_;
            $httpBackend.expectGET('../todos.json').
                respond([{title: 'todo 2'}]);

            scope = $rootScope.$new();
            ctrl = $controller('TodoCtrl', {$scope: scope});
        }));

        it('should set the todo', function() {
            $httpBackend.flush();
            expect(scope.todos).toEqualData([{title: 'todo 2'}]);
        });
    });
});
