Rails.application.routes.draw do
  	resources :bookings
  	devise_for :users
	root 'rooms#search'
end
