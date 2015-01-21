class AddCookingIngredientsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :cooking_ingredients, :string
  end
end
