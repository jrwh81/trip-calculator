class CreateExspenses < ActiveRecord::Migration
  def change
    create_table :exspenses do |t|
      t.string :name
      t.decimal :cost, :precision => 10, :scale => 2

      t.timestamps null: false
    end
  end
end
