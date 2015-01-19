class AddSurnameToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :surname, :string
  end
end
