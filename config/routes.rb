Rails.application.routes.draw do 
  
  root :to => 'browse#home'

  # MAIN PAGES

  get "home" => "browse#home"
  get "terms" => "browse#terms"
  get "about" => "browse#about"
  get "privacy" => "browse#privacy"

  ########### - UPLOADS - ###########

  # SESSIONS

  get "logout_user" => "sessions#destroy", :as => "logout_user"
  get "login" => "sessions#new"
  post "login_user" => "sessions#new", :as => "login_user"

  # USERS

  get "signup" => "users#new", :as => "signup"

  # User actions 

  get "notes" => "notes#new"
  get "profile" => "users#profile"
  get "edit_profile" => "users#edit"

  # CONTACT US

  get "contacts" => "contacts#new", :as => "contact"
  resources "contacts", only: [:new, :create]

  ########### - DOWNLOADS - ###########

  # PROFESSIONAL EXAM

  # Finance 

  get "finp" => "fp#landing"
  get "CFA1" => "fp#CFA1"

  # TEXT BOOKS

  # LECTURE NOTES

  ########### - RESOURCES - ###########
  ########### - DO NOT EDIT - ###########

  resources :users
  resources :sessions
  resources :password_resets
  resources :notes

end
