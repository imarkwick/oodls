class AddOrganisationToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :organisation, :text
  end
end
