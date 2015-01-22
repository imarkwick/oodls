class AddFruitAndVegToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :fresh_fruit_and_veg, :string
  end
end
