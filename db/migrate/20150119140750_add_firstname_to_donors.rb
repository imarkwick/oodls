class AddFirstnameToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :firstname, :string
  end
end
