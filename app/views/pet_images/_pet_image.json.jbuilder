json.extract! pet_image, :id, :created_at, :updated_at
json.url pet_image_url(pet_image, format: :json)
