class ReportedIssuesController < ApplicationController
	before_action :require_login

	def index
		if params[:category_id] && find_category
			@reported_issues = @category.reported_issues
			respond_to do |format|
				format.html 
				format.json { render json: @reported_issues }
			end
		elsif params[:postal_code]
			@reported_issues = ReportedIssue.by_postal_code(params[:postal_code])
			respond_to do |format|
				format.html 
				format.json { render json: @reported_issues }
			end
		else
			@reported_issues = ReportedIssue.all
			respond_to do |format|
				format.html 
				format.json { render json: @reported_issues }
			end
		end
	end

	def new
		if params[:category_id] && find_category
			@reported_issue = @category.reported_issues.build
		else
			@reported_issue = ReportedIssue.new
			@reported_issue.build_category
		end
	end

	def create
		@reported_issue = current_user.reported_issues.build(reported_issue_params)
		if @reported_issue.save
			respond_to do |format| 
				format.html { redirect_to reported_issue_path(@reported_issue) }
				format.json { render json: @reported_issue }
			end
		else
			@reported_issue.build_category unless @reported_issue.category
			render :new
		end
	end

	def show
		find_reported_issue
		respond_to do |format|
			format.html
			format.json { render json: @reported_issue }
		end
	end

	def edit
		find_reported_issue
	end

	def update
		find_reported_issue
		if valid_user? && @reported_issue.update(reported_issue_params)
			respond_to do |format| 
				format.html { redirect_to reported_issue_path(@reported_issue) }
				format.json { render json: @reported_issue }
			end
		else
			render :edit
		end
	end

	def destroy
		find_reported_issue
		if valid_user?
			@reported_issue.destroy
			redirect_to reported_issues_path
		else
			redirect_to reported_issue_path(@reported_issue)
		end
	end

	private

	def reported_issue_params
		params.require(:reported_issue).permit(:chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :category_id, category_attributes: [:name])
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

  def valid_user?
  	@reported_issue.user_id == current_user.id
  end

end
