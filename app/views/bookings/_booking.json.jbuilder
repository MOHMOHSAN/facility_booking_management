json.extract! booking, :id, :reservation_date, :reservation_time, :status, :cancellation_reason, :duration, :created_at, :updated_at
json.url booking_url(booking, format: :json)
