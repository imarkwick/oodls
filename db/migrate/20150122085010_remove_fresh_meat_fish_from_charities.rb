class RemoveFreshMeatFishFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :fresh_meat_fish, :string
  end
end
