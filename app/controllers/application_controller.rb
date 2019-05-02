class ApplicationController < ActionController::Base
	before_action :current_user

	private

	def current_user
		if session[:user_id].nil?
			@current_user = User.new
		else
			@current_user ||= User.find(session[:user_id])
		end
	end

	def logged_in?
		current_user.id.present?
	end

	def require_login
		unless logged_in?
			redirect_to login_path
		end
	end

end
