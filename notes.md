## Upcase all user input
## Create Admin
## Add new route/view/scope to show most reported issues 
		# Category.joins(:reported_issues).group(:category_id).order('COUNT(category_id)DESC').limit(1)
