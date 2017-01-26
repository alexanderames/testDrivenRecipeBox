require 'rails_helper'

RSpec.describe "recipes/edit", type: :view do
  before(:each) do
    @recipe = assign(:recipe, Recipe.create!(
      :name => "MyString",
      :instructions => "MyText",
      :minutes_to_prepare => 1,
      :minutes_to_cook => 1
    ))
  end

  it "renders the edit recipe form" do
    render

    assert_select "form[action=?][method=?]", recipe_path(@recipe), "post" do

      assert_select "input#recipe_name[name=?]", "recipe[name]"

      assert_select "textarea#recipe_instructions[name=?]", "recipe[instructions]"

      assert_select "input#recipe_minutes_to_prepare[name=?]", "recipe[minutes_to_prepare]"

      assert_select "input#recipe_minutes_to_cook[name=?]", "recipe[minutes_to_cook]"
    end
  end
end
