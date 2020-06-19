class RoomsController < ApplicationController
	before_action :authenticate_user!
	def search
		if !current_user
			redirect_to new_user_session_path
		end
	end

	def index
	end


	def data
		reservation_date = params["reservation_date"]

		room_type = params["room_type"]
		capacities = params["capacities"]
		@bookings = Booking.where("Date(reservation_date) = ? and status= ?",reservation_date,"Approve")
		
		@existing_bookings = {}
		@bookings.each do |booking|
			room_id = booking["room_id"]
			id = booking["id"]
			reservation_time = booking["reservation_time"].to_formatted_s(:db)
			reservation_end_time = booking["reservation_end_time"].to_formatted_s(:db)
			booking_reason = booking["booking_reason"]
			user_id = booking["user_id"]

			@existing_bookings[room_id] ||= []
			@existing_bookings[room_id] << {"id":id,"room_id":room_id,"reservation_time":reservation_time,"reservation_end_time":reservation_end_time,
				"booking_reason": booking_reason}
			
		end
		conditions = String.new
    	wheres = Array.new
		if !room_type.empty? and (room_type.downcase=="meeting" or room_type.downcase=="facility")
			conditions << " AND " unless conditions.length == 0
			conditions << "room_type like ?"
			wheres << "%#{room_type}%"
		end

		if !capacities.empty? and capacities!="All" and capacities.to_i.between?(5,10)
			conditions << " AND " unless conditions.length == 0
			conditions << "capacities = ?"
			wheres << capacities
		end

		wheres.insert(0, conditions)
		if(wheres[0] == "")
			@rooms = Room.all
		else
			@rooms = Room.where(wheres)
		end

	

	   	render :json => @rooms.map {|room| {
          :id => room.id,
          :room_name => room.room_name,
          :floor => room.floor,
          :room_type => room.room_type,
          :capacities => room.capacities,
          :bookings => (@existing_bookings[room.id].nil?)? [] : @existing_bookings[room.id]
      	}}

	end
end