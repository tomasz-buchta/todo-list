describe('todoer', function() {
    describe('Todo list view', function() {
        beforeEach(function() {
            browser.get('angular/index');
        })

        it('should filter todos as user types in the search box',function() {
            var todoList = element.all(by.repeater('todo in todos'));
            var keywords = element(by.model('keywords'));

            expect((todoList.count())).toBe(4);

            keywords.sendKeys('test');
            expect((todoList.count())).toBe(1);

            keywords.clear();
            keywords.sendKeys('sd');
            expect((todoList.count())).toBe(2);
        })
    })
})