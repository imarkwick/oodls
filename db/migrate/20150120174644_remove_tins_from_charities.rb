class RemoveTinsFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :tins, :string
  end
end
