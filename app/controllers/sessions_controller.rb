class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(name: params[:session][:name])
		if @user
			log_in @user
			redirect_to user_path(@user)
		else
			flash[:alert] = "questa persona non esiste, che triste"
			redirect_to root_path
		end
	end

	def destroy
		session.delete(:user_id) if logged_in?
		redirect_to root_path
	end
end
