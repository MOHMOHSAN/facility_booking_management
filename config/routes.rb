Rails.application.routes.draw do
  	resources :bookings
  	devise_for :users
	root 'rooms#search'

	resources :rooms

	get 'rooms/search' => 'rooms#search'
	match "rooms/data", :to => "rooms#data", :via => "post"
	# post 'bookings/save_booking' => 'bookings#create', as: :save_booking
	# match "rooms/save_booking", to: "rooms#save_booking", as: :save_booking, :via => "post"
end
