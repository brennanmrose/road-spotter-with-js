class SessionsController < ApplicationController

	def new
		@user = User.new
		render :login
	end 

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user.present? && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:notice] = "Sorry, your username or password was incorrect"
      redirect_to login_path
    end
  end

	def home
	end

	def destroy
		session.clear
		redirect_to root_path
	end

end