module ApplicationHelper

	def if_logged_in_display_logout
		if session[:user_id].present?
			link_to 'Log Out', logout_path, method: :delete
		end
	end

	def if_logged_in_display_user_show
		if user_present?
			link_to 'User Account', user_path(@user)
		end
	end

	def if_logged_in_display_categories
		if user_present?
			link_to 'Categories', categories_path
		end
	end

	private

	def user_present?
		if session[:user_id].present?
			@user = User.find(session[:user_id])
		end
	end

end
