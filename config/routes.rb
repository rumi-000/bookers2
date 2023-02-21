Rails.application.routes.draw do
  
  devise_for :users
  get 'about', to: 'homes#about'
  root to: 'homes#top'
  
  
  resources :books, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update, :index,]
  
end