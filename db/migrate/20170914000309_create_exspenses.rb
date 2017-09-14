class CreateExspenses < ActiveRecord::Migration
  def change
    create_table :exspenses do |t|
      t.string :name
      t.integer :cost

      t.timestamps null: false
    end
  end
end
