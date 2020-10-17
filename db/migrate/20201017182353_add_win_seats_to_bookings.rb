class AddWinSeatsToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :win_seats, :integer
  end
end
