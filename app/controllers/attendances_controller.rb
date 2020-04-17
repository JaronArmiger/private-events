class AttendancesController < ApplicationController
	
	def edit
		attended_event = Event.find(params[:id])
		current_user.attended_events << attended_event
		redirect_to user_path(current_user)
	end
end
