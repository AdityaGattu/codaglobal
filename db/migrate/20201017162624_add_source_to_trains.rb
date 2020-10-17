class AddSourceToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :source, :string
  end
end
