class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.integer :trainno
      t.string  :status
      t.timestamps
    end
  end
end
