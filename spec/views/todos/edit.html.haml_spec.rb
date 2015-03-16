require 'rails_helper'

RSpec.describe "todos/edit", type: :view do
  before(:each) do
    @todo = assign(:todo, Todo.create!(
      :title => "MyString",
      :description => "MyText",
      :completion => 1
    ))
  end

  it "renders the edit todo form" do
    render

    assert_select "form[action=?][method=?]", todo_path(@todo), "post" do

      assert_select "input#todo_title[name=?]", "todo[title]"

      assert_select "textarea#todo_description[name=?]", "todo[description]"

      assert_select "input#todo_completion[name=?]", "todo[completion]"
    end
  end
end
