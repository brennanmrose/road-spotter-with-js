class SessionsController < ApplicationController
	require 'securerandom'

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

  # omniauth login
  def fbcreate
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
			u.name = auth['info']['name']
			u.email = auth['info']['email']
			u.password = SecureRandom.hex(15)
  	end

  	session[:user_id] = @user.id

  	redirect_to user_path(@user)
  end

	def home
	end

	def destroy
		session.clear
		redirect_to root_path
	end

	private

	def auth
    request.env['omniauth.auth']
	end

end