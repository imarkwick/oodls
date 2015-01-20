class AddMeatFishToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :fresh_meat_fish, :string
  end
end
