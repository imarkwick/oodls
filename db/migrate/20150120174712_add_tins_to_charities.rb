class AddTinsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :tins, :string, :default => '0'
  end
end
