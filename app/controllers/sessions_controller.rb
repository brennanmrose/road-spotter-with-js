class SessionsController < ApplicationController

	def new
		@user = User.new
		render :login
	end 

	def create
		@user = User.find_by(email: params[:user][:email])
		@user = @user.try(:authenticate, params[:user][:password])
		return redirect_to login_path unless @user
		session[:user_id] = @user.id 
		redirect_to user_path(@user)
	end 

	def home
	end

	def destroy
		session.clear
		redirect_to '/'
	end

end