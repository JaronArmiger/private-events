class UsersController < ApplicationController
	
	def show
		if logged_in?
			@user = User.find(params[:id])
			@upcoming_events = @user.upcoming_events
			@previous_events = @user.previous_events
		else
			flash[:alert] = "you must be logged in"
			redirect_to root_path
		end
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		log_in @user
		redirect_to user_path(@user)
	end

	private

		def user_params
			params.require(:user).permit(:name, :email)
		end
end
