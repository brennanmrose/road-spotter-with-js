class ApplicationController < ActionController::Base
	before_action :current_user

	private

	def current_user
		@current_user ||= User.find(session[:user_id])
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
