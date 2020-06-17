class RoomsController < ApplicationController
	before_action :authenticate_user!
	def search
		if !current_user
			redirect_to new_user_session_path
		else
			@room_types = ["Meeting Room","Facility Room"]
			@option_for_floors = ["All","Level 1","Level 2","Level 3"]
			@capacities = [5,6,7,8,9,10]
		end
	end
end