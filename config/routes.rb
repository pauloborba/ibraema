Rails.application.routes.draw do
  resources :institutions do
    resources :coaching_activities
  end
  resources :facilitators
  resources :companies
  resources :people
  resources :users
  resources :donations
  resources :emails
  root 'people#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
