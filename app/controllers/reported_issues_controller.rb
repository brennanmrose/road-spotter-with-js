class ReportedIssuesController < ApplicationController

	def index
	end

	def new
		@reported_issue = ReportedIssue.new
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
		params.require(:reported_issue).permit(:chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user_id, :category_id)
	end

end
