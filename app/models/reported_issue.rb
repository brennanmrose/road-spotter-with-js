class ReportedIssue < ApplicationRecord
	belongs_to :user
	belongs_to :category
	validates :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user_id, :category_id, presence: true
	validates :postal_code, length: { is: 5 }
end
