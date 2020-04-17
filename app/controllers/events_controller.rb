class EventsController < ApplicationController
  
  def index
  	@upcoming = Event.upcoming.order(date: :desc)
    @past = Event.past.order(date: :desc)
  end

  def show
  	@event = Event.find(params[:id])
  end

  def new
  	if logged_in?
      @event = Event.new
    else
      flash[:alert] = "Must be logged in to create an event!"
      redirect_to root_path
    end
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
