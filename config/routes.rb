Rails.application.routes.draw do
  	resources :bookings, only: [:index,:create,:destroy]
  	devise_for :users
	root 'rooms#search'

	resources :rooms, only: [:index]

	get 'rooms/search' => 'rooms#search'
	match "rooms/data", :to => "rooms#data", :via => "post"
end
