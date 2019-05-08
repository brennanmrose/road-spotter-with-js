module ReportedIssuesHelper

	def if_current_user_display_edit
		if current_user?
			link_to 'Edit Issue', edit_reported_issue_path(@reported_issue)
		end
	end

	def if_current_user_display_delete
		if current_user?
			link_to 'Delete Issue', reported_issue_path(@reported_issue), method: 'delete'
		end
	end

	def link_to_ri_new_nested_or_non_nested
		if @category.present?
			link_to 'Report a New Issue', new_category_reported_issue_path(@category)
		else
			link_to 'Report a New Issue', new_reported_issue_path
		end
	end

	def current_user?
		@current_user ||= User.find(session[:user_id])
		@current_user.id == @reported_issue.user_id
	end

end
