class AddPostcodeToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :postcode, :text
  end
end
