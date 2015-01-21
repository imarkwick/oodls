class AddDriedGoodsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :dried_goods, :string
  end
end
