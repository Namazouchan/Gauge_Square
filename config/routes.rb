Rails.application.routes.draw do
  root 'pages#home'
  get 'home', to: 'pages#home'
  get 'complete', to: 'pages#complete'
  get 'feedback', to: 'pages#feedback'
  # get 'goalset', to: 'pages#goalset'
  get 'progress', to: 'pages#progress'
  get 'signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/goalset', to: 'goals#new'
  post '/goals', to: 'goals#create'

  resources :goals, only: [:edit, :update, :destroy]
  resources :feedbacks, only: [:edit, :update]

  get '/goalindex', to: 'goals#index', as: 'goalindex'
  get '/feedbackindex', to: 'feedbacks#index', as: 'feedbackindex'

  resources :users 
  # only: [:show, :create]  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
