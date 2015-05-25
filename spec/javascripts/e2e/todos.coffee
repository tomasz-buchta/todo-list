describe('Todos list view', ->
  beforeEach( ->
    browser.get('/angular/index')
  )



  it 'should render the todos list page', ->
    todosList = element.all(By.repeater('todo in todos'))
    keywords = element(By.model('keyword'))
    expect(todosList.count()).toBe(4)
)
