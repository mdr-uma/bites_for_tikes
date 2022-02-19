Rails.application.routes.draw do
  root 'welcome#home'
  get 'about' => 'about#index'

  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'

  get 'auth/facebook/callback' => 'sessions#create'
  get 'auth/github/callback' => 'sessions#create'

  get '/search' => 'meals#search'

  resources :charts do 
    resources :meals, only: [:new, :show, :index]
  end

  resources :meals
  resources :users, only: [:new, :create, :show]
end
