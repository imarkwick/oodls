class AddCoffeeAndTeaFromCharities < ActiveRecord::Migration
  def change
    add_column :charities, :coffee_and_tea, :string
  end
end
