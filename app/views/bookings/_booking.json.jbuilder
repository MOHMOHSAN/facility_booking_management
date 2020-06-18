json.extract! booking, :id, :reservation_date, :reservation_time,:reservation_end_time, :status, :cancellation_reason, :booking_reason, :created_at, :updated_at
json.url booking_url(booking, format: :json)
