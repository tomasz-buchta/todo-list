require 'rails_helper'

RSpec.describe "todos/index", type: :view do
  before(:each) do
    assign(:todos, [
      Todo.create!(
        :title => "Title",
        :description => "MyText",
        :completion => 1
      ),
      Todo.create!(
        :title => "Title",
        :description => "MyText",
        :completion => 1
      )
    ])
  end

  it "renders a list of todos" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
