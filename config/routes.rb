Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/cloud', to: 'pages#cloud', as: :cloud
end
