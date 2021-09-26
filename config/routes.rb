Rails.application.routes.draw do
  resources :prices
  resources :activities
  root 'clients#index';

  resources :users
  resources :clients
  resources :teachers
  resource :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
