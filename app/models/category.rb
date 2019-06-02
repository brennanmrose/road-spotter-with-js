class Category < ApplicationRecord
	validates :name, uniqueness: true, presence: true

	has_many :reported_issues
	has_many :users, through: :reported_issues
	
end