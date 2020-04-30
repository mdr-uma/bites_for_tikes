Rails.application.routes.draw do
  get 'welcome/home'
  resources :charts
  resources :meals
  resources :users
end
