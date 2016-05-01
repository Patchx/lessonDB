Rails.application.routes.draw do
  root to: 'visitors#home'
  devise_for :users

	resources :users
  resources :lessons
  resources :searches

  # For attachinary gem (file upload)
	mount Attachinary::Engine => "/attachinary"

end
