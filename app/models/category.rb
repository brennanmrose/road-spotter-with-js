class Category < ApplicationRecord
	has_many :reported_issues
	has_many :users, through: :reported_issues
end
