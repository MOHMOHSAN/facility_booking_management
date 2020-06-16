class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.date :reservation_date
      t.time :reservation_time
      t.time :reservation_end_time
      t.string :status, :default => "Approve"
      t.text :cancellation_reason
      t.text :booking_reason
      t.integer :room_id
      t.integer :user_id
      t.timestamps
    end
  end
end
