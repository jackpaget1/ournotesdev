Rails.application.routes.draw do 
  
  root :to => 'browse#home'

  #Sessions Users

  get "logout_user" => "sessions#destroy", :as => "logout_user"
  get "login" => "sessions#new"
  post "login_user" => "sessions#new", :as => "login_user"

  get "home" => "browse#home"
  get "terms" => "browse#terms"
  get "about" => "browse#about"
  get "privacy" => "browse#privacy"

  # finance section 

  get "finp" => "fp#landing"

  #Users

  get "signup" => "users#new", :as => "signup"
  post "change_payment" => "users#change_payment", :as => "update"
  get "notes" => "notes#new"
  
  resources :users
  resources :sessions
  resources :password_resets
  resources :notes

  # Private pages - login required

  get "profile" => "uploader#profile"
  get "editprofile" => "uploader#edit_profile"
  get "files" => "upload#upload"
  get "change_payment" => "users#change_payment"

  # contact form

  get "contacts" => "contacts#new", :as => "contact"
  resources "contacts", only: [:new, :create]

end
