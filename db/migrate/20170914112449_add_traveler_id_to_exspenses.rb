class AddTravelerIdToExspenses < ActiveRecord::Migration
  def change
    add_column :exspenses, :traveler_id, :integer
  end
end
