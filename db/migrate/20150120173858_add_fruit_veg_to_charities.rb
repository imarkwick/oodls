class AddFruitVegToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :fresh_fruit_veg, :string
  end
end
