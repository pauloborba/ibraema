Rails.application.routes.draw do
  resources :emails
  resources :institutions
  resources :facilitators
  resources :coaching_activities
  resources :users
  root 'users#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
