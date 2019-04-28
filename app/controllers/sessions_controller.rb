class SessionsController < ApplicationController

	def new
		render :login
		@user = User.new
	end 

	def create
	end 

	def home
	end

	def destroy
		session.clear
		redirect_to '/'
	end

end