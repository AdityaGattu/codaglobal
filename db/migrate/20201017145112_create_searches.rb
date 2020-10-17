class CreateSearches < ActiveRecord::Migration[6.0]
  def change
    create_table :searches do |t|
      t.integer :train
      t.date :travel_date
      t.integer :win_seats
      t.integer :nom_seats
      t.timestamps
    end
  end
end
