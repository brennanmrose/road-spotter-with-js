class ReportedIssue < ApplicationRecord
	validates :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user_id, :category_id, presence: true
	validates :postal_code, length: { is: 5 }

	belongs_to :user
	belongs_to :category

	def category_attributes=(attributes)
		category = Category.find_or_initialize_by(name: name)
		self.category = category if category.valid?
	end

	def self.find_by_postal_code(postal_code)
		where('postal_code =?', postal_code)
	end

end
