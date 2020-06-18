Rails.application.routes.draw do
  	resources :bookings
  	devise_for :users
	root 'rooms#search'

	resources :rooms

	get 'rooms/search' => 'rooms#search'
	match "rooms/data", :to => "rooms#data", :via => "post"
end
