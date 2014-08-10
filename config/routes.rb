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

  get "Finance_pe_landing" => "downloads#Finance_pe_landing"
  get "Accounting_pe_landing" => "downloads#Accounting_pe_landing"
  get "Legal_pe_landing" => "fp#Legal_pe_landing"
  get "Medical_pe_landing" => "fp#Medical_pe_landing"

  # TEXT BOOKS

  # LECTURE NOTES

  ########### - RESOURCES - ###########
  ########### - DO NOT EDIT - ###########

  resources :users
  resources :sessions
  resources :password_resets
  resources :notes
  resources :fp
  resources :downloads
  resources :previews
  resources :baskets

  match "/downloads/:type(/:category(/:title(/:uploader)))" => "downloads#new", :via => [:get]
  match "/preview/:id" => "previews#new", :via => [:get]
  match "/basket/:id" => "baskets#new", :via => [:get]
end
