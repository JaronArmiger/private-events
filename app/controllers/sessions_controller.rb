class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(name: params[:session][:name])
		session[:user_id] = @user.id
		redirect_to user_path(@user)
	end

	def destroy
		session.delete(:user_id) if session[:user_id]
	end
end
