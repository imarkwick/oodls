class AddDrinksToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :drinks, :string
  end
end
