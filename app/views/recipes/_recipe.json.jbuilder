json.extract! recipe, :id, :name, :instructions, :minutes_to_prepare, :minutes_to_cook, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)