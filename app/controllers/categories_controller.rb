class CategoriesController < ApplicationController

	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.find_by(name: params[:category][:name])
		if @category.nil?
			@category = Category.create(category_params)
		end
		redirect_to category_path(@category)
	end

	def show
	end

	private

	def category_params
		params.require(:category).permit(:name)
	end

end
