class ChangeColumnTypeInBooking < ActiveRecord::Migration[5.2]
  def change
  	change_column :bookings, :reservation_time, :datetime
  	change_column :bookings, :reservation_end_time, :datetime
  end
end
