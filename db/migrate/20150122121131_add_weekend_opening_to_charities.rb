class AddWeekendOpeningToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :weekend_opening_hours, :text
  end
end
