class AddPrimaryPostcodeToDonors < ActiveRecord::Migration
  def change
    add_column :donors, :primary_postcode, :string
  end
end
