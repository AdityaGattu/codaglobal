class CreateTrains < ActiveRecord::Migration[6.0]
  def change
    create_table :trains do |t|
      t.string :trainno
      t.integer :win_seats
      t.integer :nor_seats
      t.integer :price
      t.timestamps
    end
  end
end
