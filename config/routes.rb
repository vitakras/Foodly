Rails.application.routes.draw do

  resources :meal

  root 'home#index'
  devise_for :members

  get 'dashboard' => 'dashboard#index'
  post 'dashboard' => 'meal#create'
  get 'about' => 'home#about'

  get '/profile' => 'profile#index'
  get '/profile/:id', to: 'profile#show', as: 'show_profile'
  get '/profile/:id/edit', to: 'profile#edit', as: 'edit_profile'
  patch '/profile/:id/update', to: 'profile#update', as: 'update_profile'

  # get '/meals/new', to: 'meal#index'
  get '/meals/new', to: 'meal#new'


end
