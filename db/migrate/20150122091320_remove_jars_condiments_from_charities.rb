class RemoveJarsCondimentsFromCharities < ActiveRecord::Migration
  def change
    remove_column :charities, :jars_condiments, :string
  end
end
