class AddDayToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :day, :string
  end
end
