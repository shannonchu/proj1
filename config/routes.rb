Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :trainers
  resources :trainers
  resources :pokemon
  patch 'capture', to: 'pokemon#capture', as: 'capture'
  patch 'damage', to: 'pokemon#damage', as: 'damage'
  get 'new', to: 'pokemon#new'
  post 'create', to: 'pokemon#create'
end
