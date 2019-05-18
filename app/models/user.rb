class User < ApplicationRecord
	validates :name, :email, presence: true
	validates :email, uniqueness: true

	has_many :reported_issues
	has_many :categories, through: :reported_issues

	has_secure_password
	
end
