class RemoveFreshFruitVegFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :fresh_fruit_veg, :string
  end
end
