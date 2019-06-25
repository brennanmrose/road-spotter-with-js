class ReportedIssueSerializer < ActiveModel::Serializer
  attributes :id, :chief_complaint, :transportation_type, :street_address, :locality, :region, :postal_code, :user_id, :category_id
  belongs_to :user
	belongs_to :category
end