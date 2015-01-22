class RemoveCoffeeTeaFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :coffee_tea, :string
  end
end
