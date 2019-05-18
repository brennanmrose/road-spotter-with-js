class ReportedIssue < ApplicationRecord
	validates :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user, :category, presence: true
	validates :postal_code, length: { is: 5 }

	belongs_to :user
	belongs_to :category

	scope :find_by_postal_code, -> (postal_code){where("postal_code = ?", postal_code)}

	accepts_nested_attributes_for :category

end
