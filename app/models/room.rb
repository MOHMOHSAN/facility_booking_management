class Room < ApplicationRecord
	validates_presence_of :room_name
	validates_presence_of :floor
	validates_presence_of :room_type
end
