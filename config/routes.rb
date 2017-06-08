Rails.application.routes.draw do
  resources :coaching_activities
  resources :institutions
  resources :facilitators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
