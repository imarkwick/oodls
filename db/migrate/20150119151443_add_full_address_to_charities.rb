class AddFullAddressToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :full_address, :text
  end
end
