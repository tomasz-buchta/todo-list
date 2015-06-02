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
    todosList.all(By.css('.pricing-table a')).first().click()
    element.all(By.css('.button')).last().click()
    expect(browser.getLocationAbsUrl()).toBe('/todos')

  it 'should add a new todo and delete one', ->
    expect(todosList.count()).toBe(15)
    element(By.css('.button-new')).click()
    expect(browser.getLocationAbsUrl()).toBe('/todos/new')
    element(By.model('todo.title')).sendKeys('test Title')
    element(By.model('todo.description')).sendKeys('test description')
    element(By.model('todo.completion')).sendKeys(75)
    element.all(By.css('input')).last().click()
    element.all(By.css('.button')).last().click()
    expect(browser.getLocationAbsUrl()).toBe('/todos')
    expect(todosList.count()).toBe(16)
    element.all(By.css('.button-delete')).last().click()
    alertDialog = browser.switchTo().alert()
    alertDialog.accept()
    expect(todosList.count()).toBe(15)
)
