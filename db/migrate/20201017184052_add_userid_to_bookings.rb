class AddUseridToBookings < ActiveRecord::Migration[6.0]
  def change
    add_column :bookings, :userid, :integer
  end
end
