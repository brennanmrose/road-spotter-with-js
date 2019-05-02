module ReportedIssuesHelper

	def if_current_user_display_edit
		@current_user ||= User.find(session[:user_id])
		if @current_user.id == @reported_issue.user_id
			link_to 'Edit Issue', edit_reported_issue_path(@reported_issue)
		end
	end

end
