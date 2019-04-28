class ReportedIssue < ApplicationRecord
	belongs_to :user
	belongs_to :category
	validates :name, uniqueness: true, presence: true
end
