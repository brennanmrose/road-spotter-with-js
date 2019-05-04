class CreateReportedIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :reported_issues do |t|
      t.text :chief_complaint, allow_nil: false
      t.string :transportation_type, allow_nil: false
      t.string :street_address, allow_nil: false
      t.string :locality, allow_nil: false
      t.string :region, allow_nil: false
      t.string :postal_code, allow_nil: false
      t.integer :user_id, allow_nil: false
      t.integer :category_id, allow_nil: false

      t.timestamps
    end
  end
end
