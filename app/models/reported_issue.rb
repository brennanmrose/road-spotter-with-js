class ReportedIssue < ApplicationRecord
	belongs_to :user
	belongs_to :category
	validates :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user_id, :category_id, presence: true
	validates :postal_code, length: { is: 5 }

	def category_name
		self.try(:category).try(:name)
	end

	def category_name=(name)
		category = Category.find_or_create_by(name: name)
		self.category = category
	end
	
end
