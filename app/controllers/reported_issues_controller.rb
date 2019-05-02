class ReportedIssuesController < ApplicationController
	before_action :require_login

	def index
		if params[:category_id] && find_category
			@reported_issues = @category.reported_issues
		else
			@reported_issues = ReportedIssue.all
		end
	end

	def new
		if params[:category_id] && find_category
			@reported_issue = @category.reported_issues.build
		else
			@reported_issue = ReportedIssue.new
		end
	end

	def create
		@reported_issue = current_user.reported_issues.build(reported_issue_params)
		@category = Category.find(@reported_issue.category_id)
		@category.reported_issues << @reported_issue
		if @reported_issue.save
			redirect_to reported_issue_path(@reported_issue)
		else
			render :new
		end
	end

	def show
		find_reported_issue
	end

	def edit
		find_reported_issue
	end

	def update
		find_reported_issue
		if @reported_issue.update(reported_issue_params)
			redirect_to reported_issue_path(@reported_issue)
		else
			render :edit
		end
	end

	def destroy
		find_reported_issue
		@reported_issue.destroy
		redirect_to reported_issues_path
	end

	private

	def reported_issue_params
		params.require(:reported_issue).permit(:chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :category_id, :category_name)
	end

	def find_reported_issue
  	@reported_issue = ReportedIssue.find(params[:id])
  	if !@reported_issue
  		redirect_to reported_issues_path
  	end
  end

  def find_category
  	@category = Category.find_by_id(params[:category_id])
  end

end
