class AddJarsCondimentsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :jars_and_condiments, :string
  end
end
