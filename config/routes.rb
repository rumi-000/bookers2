Rails.application.routes.draw do
  
  devise_for :users
  
  root to: 'homes#top'

  
  get '/home/about', to: 'homes#about'
  resources :books, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index,]
end