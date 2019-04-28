class CreateReportedIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :reported_issues do |t|
      t.text :chief_complaint
      t.string :transportation_type
      t.string :street_address
      t.string :locality
      t.string :region
      t.integer :postal_code
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
