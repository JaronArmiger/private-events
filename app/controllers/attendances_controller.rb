class AttendancesController < ApplicationController
	
	def edit
		attended_event = Event.find(params[:id])
		invitation = Invitation.where(invited_guest_id: current_user.id, 
									  invited_event_id: params[:id] )[0]
		current_user.attended_events << attended_event
		invitation.delete
		redirect_to user_path(current_user)
	end
end
