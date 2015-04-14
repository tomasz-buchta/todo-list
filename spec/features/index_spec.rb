require 'spec_helper.rb'

feature "Looking up for todos", js: true do
  scenario "finding todos" do
    todo = FactoryGirl.create(:todo,title: 'Shopping')
    visit '/angular/index'
    expect(page).to have_content("Shopping")
  end
end
