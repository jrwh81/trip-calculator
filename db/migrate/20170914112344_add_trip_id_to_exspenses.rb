class AddTripIdToExspenses < ActiveRecord::Migration
  def change
    add_column :exspenses, :trip_id, :integer
  end
end
