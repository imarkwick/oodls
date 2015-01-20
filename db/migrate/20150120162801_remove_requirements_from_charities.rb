class RemoveRequirementsFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :requirements, :text
  end
end
