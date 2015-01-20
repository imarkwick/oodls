class AddJarsCondimentsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :jars_condiments, :string
  end
end
