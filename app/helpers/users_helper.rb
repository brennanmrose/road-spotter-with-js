module UsersHelper

	def if_no_reported_issues_present_display_message
		if @user.reported_issues.empty?
			'You have not yet created a reported issue'
		end
	end

end
