module SessionsHelper

	def if_logged_out_display_signup
		if user_nil?
			link_to 'Sign Up', signup_path
		end
	end

	def if_logged_out_display_login
		if user_nil?
			link_to 'Log In', login_path
		end
	end

	def if_logged_out_display_fb_signup
		if user_nil?
			link_to 'Sign in through Facebook', '/auth/facebook'
		end
	end

	private

	def user_nil?
		session[:user_id].nil?
	end

end