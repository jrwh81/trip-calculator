class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :user_name
      t.string :encrypted_password

      t.timestamps null: true
    end
  end
end
