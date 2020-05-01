Rails.application.routes.draw do
  # get 'welcome/home'
  root 'welcome#home'
  get '/signup' => 'users#new'
  get '/signin' => 'welcome#new'
  post '/signin' => 'welcome#create'
  resources :charts
  resources :meals
  resources :users
end
