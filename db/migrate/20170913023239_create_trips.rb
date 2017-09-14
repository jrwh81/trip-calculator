class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.decimal :total_cost, :precision => 10, :scale => 2
      t.string :name
      t.string :description

      t.timestamps null: false
    end
  end
end
