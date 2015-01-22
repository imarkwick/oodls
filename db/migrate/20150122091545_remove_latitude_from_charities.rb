class RemoveLatitudeFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :latitude, :float
  end
end
