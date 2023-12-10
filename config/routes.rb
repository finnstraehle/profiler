Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :resumes, only: %i[index]
  resources :cover_letters, only: %i[index]
  resources :applications, only: %i[index show new create edit update destroy]
end
