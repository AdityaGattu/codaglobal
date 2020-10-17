class AddTrainNameToTrains < ActiveRecord::Migration[6.0]
  def change
    add_column :trains, :train_name, :string
  end
end
