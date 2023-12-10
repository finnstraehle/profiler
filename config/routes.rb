Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cover_letters, only: %i[index]
  resources :applications, only: %i[index]
end
