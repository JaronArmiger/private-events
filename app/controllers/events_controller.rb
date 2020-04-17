class EventsController < ApplicationController
  
  def index
  	@events = Event.all.order(date: :desc)
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	@event = Event.new
  end

  def create
  	current_user.hosted_events.build(event_params)
  	current_user.save
  	redirect_to user_path(current_user)
  end



  private

  	def event_params
  		params.require(:event).permit(:name, :date,
  									  :lcation, :description)
  	end
end
