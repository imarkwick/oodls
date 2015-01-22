class AddWeekdayOpeningToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :weekday_opening_hours, :text
  end
end
