Rails.application.routes.draw do
  
  root 'sessions#home' 
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to:  'sessions#fbcreate'
  get '/search', to: 'reported_issues#index'

  resources :users, only: [:index, :show, :create]

  resources :categories do
  	resources :reported_issues, only: [:new, :index, :show]
  end

  resources :reported_issues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
