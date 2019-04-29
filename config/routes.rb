Rails.application.routes.draw do
  
  root 'sessions#home' 
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users, only: [:index, :show, :new, :create]

  resources :categories do
  	resources :reported_issues, only: [:show, :index]
  end

  resources :reported_issues
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
