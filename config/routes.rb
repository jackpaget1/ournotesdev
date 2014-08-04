Rails.application.routes.draw do
  
  get 'docnotes/index'

  get 'docnotes/new'

  get 'docnotes/create'

  get 'docnotes/destroy'

  get 'docnote/index'

  get 'docnote/new'

  get 'docnote/create'

  get 'docnote/destroy'

  get 'files/index'

  get 'files/new'

  get 'files/create'

  get 'files/destroy'

  get 'password_resets/new'

  get 'uploader/profile'

  get 'uploader/files'

  get 'fp/CFA1'

  get 'fp/CFA2'

  get 'fp/CFA3'

  get 'sessions/new'

  get 'sessions/destroy'

  get 'users/new'

  get 'users/create'

  root :to => 'browse#home'

  get 'browse/profile'
  get 'browse/message'
  get 'browse/aboutus'

  #Sessions Users
  get "logout_user" => "sessions#destroy", :as => "logout_user"
  get "login" => "sessions#new"
  post "login_user" => "sessions#new", :as => "login_user"

  get "home" => "browse#home"
  get "terms" => "browse#terms"
  get "about" => "browse#about"

  # finance section 
  get "finp" => "fp#landing"
  #Users
  get "signup" => "users#new", :as => "signup"
  post "change_payment" => "users#change_payment", :as => "update"
  get "docnote" => "docnotes#index"
  
  resources :users
  resources :sessions
  resources :password_resets
  resources :docnotes, only: [:index, :new, :create, :destroy]

  # Private pages - login required

  get "profile" => "uploader#profile"
  get "files" => "upload#upload"
  get "change_payment" => "users#change_payment"

end
