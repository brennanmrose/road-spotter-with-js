class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :reported_issues
  has_many :users, through: :reported_issues
end
