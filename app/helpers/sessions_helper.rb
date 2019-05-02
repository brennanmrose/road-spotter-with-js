module SessionsHelper

	def if_logged_out_display_signup
		if session[:user_id].nil?
			link_to 'Sign Up', signup_path
		end
	end

	def if_logged_out_display_login
		if session[:user_id].nil?
			link_to 'Log In', login_path
		end
	end

end