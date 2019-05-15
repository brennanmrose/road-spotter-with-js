class ReportedIssue < ApplicationRecord
	validates :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user_id, :category_id, presence: true
	validates :postal_code, length: { is: 5 }

	belongs_to :user
	belongs_to :category

	accepts_nested_attributes_for :category

	def category_name
		category.try(:name)
	end

	def category_name=(name)
		self.category = Category.find_or_initialize_by(name: name)
	end
	
end
