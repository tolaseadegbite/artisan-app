json.extract! profile, :id, :artisan_id, :name, :about, :created_at, :updated_at
json.url profile_url(profile, format: :json)
