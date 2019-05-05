class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name, allow_nil: false
      t.string :last_name
      t.string :email, unique: true, allow_nil: false
      t.string :password_digest

      t.timestamps
    end
  end
end
