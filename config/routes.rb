Rails.application.routes.draw do
  resources :companies
  resources :people
  resources :users
  resources :donations
  resources :emails
  root 'application#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
