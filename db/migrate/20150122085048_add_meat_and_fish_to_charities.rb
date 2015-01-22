class AddMeatAndFishToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :fresh_meat_and_fish, :string
  end
end
