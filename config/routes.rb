Rails.application.routes.draw do
  devise_for :users  # Devise routes for user authentication, registration, etc.
  root to: 'pages#home'  # Root URL route to 'home' action in 'pages' controller
  get "/cover_letter", to: "pages#cover_letter", as: :coverletter  # Route for cover letter page
  get "/cv", to: "pages#cv", as: :cv  # Route for CV page
  get "/about", to: "pages#about", as: :about  # Route for about page

  resources :resumes, only: %i[index show new create update destroy]  # Routes for resumes
  resources :cover_letters, only: %i[index show new create update destroy]  # Routes for cover letters
  resources :applications, only: %i[index show new create edit update destroy]  # Routes for applications
  resources :cover_letter_entries, only: %i[new create edit update destroy]  # Routes for cover letter entries
  resources :resume_entries, only: %i[new create edit update destroy]  # Routes for resume entries
end
