class RemoveLongitudeFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :longitude, :float
  end
end
