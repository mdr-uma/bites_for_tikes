Rails.application.routes.draw do
  # get 'welcome/home'
  root 'welcome#home'
  get '/signup' => 'users#new'
  get '/signin' => 'welcome#new'
  post '/signin' => 'welcome#create'
  get 'about' => 'about#index'
  
  resources :users do
    resources :charts, only: [:index, :show]
  end
  resources :charts do 
    resources :meals, only: [:new, :show, :index]
  end
    resources :meals

end
