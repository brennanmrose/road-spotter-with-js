class CategoriesController < ApplicationController
	before_action :require_login

	def index
		@categories = Category.all
		respond_to do |format|
			format.html 
			format.json { render json: @categories }
		end
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.find_or_initialize_by(category_params)
		if @category.save
			respond_to do |format| 
				format.html { redirect_to category_path(@category) }
				format.json { render json: @category }
			end
		else
			render :new
		end
	end

	def next
		@category = Category.find(params[:id])
		@next_category = @category.next
		render json: @next_category
	end

	def show
		@category = Category.find(params[:id])
		respond_to do |format|
			format.html
			format.json { render json: @category }
		end
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

end
