class Category < ApplicationRecord
	validates :name, uniqueness: true, presence: true

	has_many :reported_issues
	has_many :users, through: :reported_issues
	
	def next
		category = Category.where("id > ?", id).first
		if category
			category
		else
			Category.first
		end
	end

end