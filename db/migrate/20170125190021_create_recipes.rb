class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :instructions
      t.integer :minutes_to_prepare
      t.integer :minutes_to_cook

      t.timestamps
    end
  end
end
