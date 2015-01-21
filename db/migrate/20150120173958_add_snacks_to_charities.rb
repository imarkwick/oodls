class AddSnacksToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :snacks, :string
  end
end
