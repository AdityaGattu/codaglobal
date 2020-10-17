class AddDestinationToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :destination, :string
  end
end
