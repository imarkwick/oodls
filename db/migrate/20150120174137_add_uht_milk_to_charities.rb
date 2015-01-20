class AddUhtMilkToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :uht_milk, :string
  end
end
