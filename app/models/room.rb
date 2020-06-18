class Room < ApplicationRecord
	enum room_type: {"Meeting Room": "Meeting", "Facility Room": "Facility", "All Types": "All"}
	# enum floor: ["All","Level 1","Level 2","Level 3"]
	enum size: {"5 pax": "5","6 pax": "6", "7 pax": "7","8 pax": "8","9 pax": "9","10 pax": "10", "All size(s)": "All"}
	validates_presence_of :room_name
	validates_presence_of :floor
	validates_presence_of :room_type
	validates_uniqueness_of :room_name
	has_many :bookings, dependent: :destroy, inverse_of: :room

end
