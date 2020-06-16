class Booking < ApplicationRecord
	belongs_to :user, :inverse_of => :bookings

	belongs_to :room, :inverse_of => :bookings

	validates_presence_of :user_id
	validates_presence_of :room_id
	validates_presence_of :reservation_date
	validates_presence_of :reservation_time
	validates_presence_of :reservation_end_time

end
