json.extract! appointment, :id, :user_id, :datetime, :title, :content, :location, :done, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
