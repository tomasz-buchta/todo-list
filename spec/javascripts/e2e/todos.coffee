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

  it 'should display detail page of first todo and go back to main page', ->
    keywords.sendKeys('title 2')
    expect(todosList.count()).toBe(1)
    todosList.all(By.css('.pricing-table')).first().click()
    expect(browser.getLocationAbsUrl()).toBe('/todos/5564072c546f6d6a90010000')
    element.all(By.css('.button')).first().click()
    expect(browser.getLocationAbsUrl()).toBe('/todos')
)
