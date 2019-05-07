class User < ApplicationRecord
	has_secure_password
	has_many :reported_issues
	has_many :categories, through: :reported_issues
	validates :name, :email, presence: true
	validates :email, uniqueness: true
end
