require 'rails_helper'

RSpec.describe "recipes/new", type: :view do
  before(:each) do
    assign(:recipe, Recipe.new(
      :name => "MyString",
      :instructions => "MyText",
      :minutes_to_prepare => 1,
      :minutes_to_cook => 1
    ))
  end

  it "renders new recipe form" do
    render

    assert_select "form[action=?][method=?]", recipes_path, "post" do

      assert_select "input#recipe_name[name=?]", "recipe[name]"

      assert_select "textarea#recipe_instructions[name=?]", "recipe[instructions]"

      assert_select "input#recipe_minutes_to_prepare[name=?]", "recipe[minutes_to_prepare]"

      assert_select "input#recipe_minutes_to_cook[name=?]", "recipe[minutes_to_cook]"
    end
  end
end
