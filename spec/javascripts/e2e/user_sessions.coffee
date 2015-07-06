describe('User session', ->
  beforeEach( ->
    browser.get('/angular/index')
  )

  it 'should get to login page and login as user and return to main page', ->
    $('.right').$('.button').click()
    element(By.model('loginForm.email')).sendKeys('user@example.com')
    element(By.model('loginForm.password')).sendKeys('xsw2zaq1')
    element(By.css('.btn')).click()
    expect(browser.getLocationAbsUrl()).toBe('/todos')
)