class CreateTravelers < ActiveRecord::Migration
  def change
    create_table :travelers do |t|
      t.string :name
      t.float :spent

      t.timestamps null: false
    end
  end
end
