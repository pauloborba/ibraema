Rails.application.routes.draw do
  resources :users
  resources :persons
  resources :companies
  resources :donations
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
