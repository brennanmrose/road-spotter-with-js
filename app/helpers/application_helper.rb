module ApplicationHelper

	def if_logged_in_display_logout
		if session[:user_id].present?
			link_to 'Log Out', logout_path, method: :delete
		end
	end

end
