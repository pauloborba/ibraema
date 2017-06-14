Rails.application.routes.draw do
  get '/institutions/report' => 'institutions#createReport'
  post '/institutions/downloadReport' => 'institutions#downloadReport'
  resources :institutions do
    resources :coaching_activities do
      resources :facilitators
    end
  end
  resources :companies
  resources :people
  resources :users
  resources :donations
  resources :emails
  resources :articles
  root 'people#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
