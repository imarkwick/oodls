class AddNoneToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :none, :string
  end
end
