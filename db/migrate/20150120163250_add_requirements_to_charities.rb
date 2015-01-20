class AddRequirementsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :tins, :boolean
  end
end
