class ReportedIssuesController < ApplicationController

	def index
	end

	def new
		if params[:category_id] && cat = Category.find_by_id(params[:category_id])
			@reported_issue = cat.reported_issues.build
		else
			@reported_issue = ReportedIssue.new
		end
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def reported_issue_params
		params.require(:reported_issue).permit(:chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :category_id, :category_name)
	end

end
