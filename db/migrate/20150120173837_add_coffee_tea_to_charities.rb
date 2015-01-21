class AddCoffeeTeaToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :coffee_tea, :string
  end
end
