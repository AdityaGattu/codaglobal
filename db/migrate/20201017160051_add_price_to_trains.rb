class AddPriceToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :price, :integer
  end
end
