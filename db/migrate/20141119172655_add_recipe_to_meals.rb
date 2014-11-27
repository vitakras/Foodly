class AddRecipeToMeals < ActiveRecord::Migration
  def change
    add_column :meals, :recipe, :string
  end
end
