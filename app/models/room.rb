class Room < ApplicationRecord
	validates_presence_of :room_name
	validates_presence_of :floor
	validates_presence_of :room_type
	validates_uniqueness_of :room_name
	has_many :bookings, dependent: :destroy, inverse_of: :room
	
end
