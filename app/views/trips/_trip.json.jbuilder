json.extract! trip, :id, :total_cost, :name, :description, :created_at, :updated_at
json.url trip_url(trip, format: :json)
