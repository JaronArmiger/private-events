class InvitationsController < ApplicationController
	def new
		@event = Event.find(params[:event_id])
		@users = User.all
	end

	def create
		@user = User.find(params[:user_id])
		@event = Event.find(params[:event_id])
		@event.invited_guests << @user
		redirect_to event_path(@event)
	end
end
