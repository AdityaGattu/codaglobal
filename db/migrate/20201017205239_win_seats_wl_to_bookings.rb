class WinSeatsWlToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :win_seats_wl, :integer
    add_column :bookings, :nor_seats_wl, :integer
  end
end
