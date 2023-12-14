Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/cover_letter", to: "pages#cover_letter", as: :coverletter
  get "/cv", to: "pages#cv", as: :cv
  get "/about", to: "pages#about", as: :about

  resources :resumes, only: %i[index show new create update destroy]
  resources :cover_letters, only: %i[index show new create update destroy]
  resources :applications, only: %i[index show new create edit update destroy]
end
