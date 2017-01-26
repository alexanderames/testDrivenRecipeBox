require 'spec_helper'

describe 'creating recipes'  do
	it 'redirects to recipe index on success' do
		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread"
		fill_in "Minutes to prepare", with: "2"
		fill_in "Minutes to cook", with: "1"
		click_button "Create Recipe"

		expect(page).to have_content("Chicken Salad Sandwich")
	end 

	it "displays an error when recipe has no name" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: ""
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread"
		fill_in "Minutes to prepare", with: "2"
		fill_in "Minutes to cook", with: "1"
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Place Chicken Salad between two pieces of bread")
	end

	it "displays an error when recipe name has less than 5 characters" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Soup"
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread"
		fill_in "Minutes to prepare", with: "2"
		fill_in "Minutes to cook", with: "1"
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Place Chicken Salad between two pieces of bread")
	end

	it "displays an error when recipe has no instructions" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: ""
		fill_in "Minutes to prepare", with: "2"
		fill_in "Minutes to cook", with: "1"
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Chicken Salad Sandwich")
	end

	it "displays an error when recipe instructions has less than 20 characters" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: "Bread"
		fill_in "Minutes to prepare", with: "2"
		fill_in "Minutes to cook", with: "1"
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Chicken Salad Sandwich")
	end

	it "displays an error when recipe has no prep time" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread"
		fill_in "Minutes to prepare", with: ""
		fill_in "Minutes to cook", with: "1"
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Chicken Salad Sandwich")
	end

	it "displays an error when recipe has no cook time" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread"
		fill_in "Minutes to prepare", with: "2"
		fill_in "Minutes to cook", with: ""
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Chicken Salad Sandwich")
	end

	it "displays an error when cook time and prep time are not integers" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread"
		fill_in "Minutes to prepare", with: "peanuts"
		fill_in "Minutes to cook", with: "bananas"
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Chicken Salad Sandwich")
	end

	it "displays an error when recipe has a prep time less than 1" do 
		expect(Recipe.count).to eq(0)

		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread"
		fill_in "Minutes to prepare", with: "0"
		fill_in "Minutes to cook", with: "1"
		click_button "Create Recipe"

		expect(page).to have_content("error")
		expect(Recipe.count).to eq(0)

		visit 'recipes'
		expect(page).to_not have_content("Chicken Salad Sandwich")
	end

	it "displays the total recipe time on show page" do 
		visit '/recipes'
		click_link 'New Recipe'
		expect(page).to have_content("New Recipe")

		fill_in "Name", with: "Chicken Salad Sandwich"
		fill_in "Instructions", with: "Place Chicken Salad between two pieces of bread, toasted. "
		fill_in "Minutes to prepare", with: "2"
		fill_in "Minutes to cook", with: "3"
		click_button "Create Recipe"

		expect(page).to have_content("Total time is 5 minutes")
	end


end
