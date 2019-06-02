class ReportedIssue < ApplicationRecord
	validates :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user, :category, presence: true
	validates :postal_code, length: { is: 5 }

	belongs_to :user
	belongs_to :category

	scope :by_postal_code, -> (postal_code){ where("postal_code = ?", postal_code) }

	def category_attributes=(attributes)
  	category = Category.find_or_create_by(attributes)
  	self.category = category if category.valid?
  end

end
