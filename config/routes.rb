Rails.application.routes.draw do
  # get 'welcome/home'
  root 'welcome#home'
  get '/signup' => 'users#new'
  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  delete '/signout' => 'sessions#destroy'
  get 'about' => 'about#index'
  
  resources :charts do 
    resources :meals, only: [:new, :show, :index]
  end
  resources :meals
  resources :users, except: :index do
    resources :charts, only: [:index, :show]
  end
end
