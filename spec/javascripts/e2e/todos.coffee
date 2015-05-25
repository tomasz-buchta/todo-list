describe('Todos list view', ->
  beforeEach( ->
    browser.get('/angular/index')
  )

  todosList = element.all(By.repeater('todo in todos'))
  keywords = element(By.model('keywords'))

  it 'should render the todos list page', ->

    expect(todosList.count()).toBe(15)

  it 'should filter the todo list as user types in the search box', ->
    expect(todosList.count()).toBe(15)
    keywords.sendKeys('title 2')
    expect(todosList.count()).toBe(1)
)
