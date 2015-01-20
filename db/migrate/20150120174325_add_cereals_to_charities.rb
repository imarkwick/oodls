class AddCerealsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :cereals, :string
  end
end
