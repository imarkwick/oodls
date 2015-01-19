class AddContactNameToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :contact_name, :text
  end
end
