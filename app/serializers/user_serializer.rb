class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email
  has_many :reported_issues
	has_many :categories, through: :reported_issues
end
