class AddNorSeatsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :nor_seats, :integer
  end
end
