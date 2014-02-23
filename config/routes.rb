Calapps::Application.routes.draw do
  get "password_resets/new"

  get "welcome/about"
  get "welcome/success"
  get "welcome/construction"
  get "users/new"
  get 'tags/:tag', to: 'calapps#index', as: :tag

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', :to => 'sessions#destroy',     via: :delete
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match '/contact' => 'contact#create', :as => 'contact', :via => :post
  match '/category/:category', to: 'calapps#category', via: 'get'
 
  resources :users
  
  resources :calapps do
    get 'search', on: :collection
    resources :reviews, :only => [:create, :new, :destroy]
  end
  
  resources :sessions
  resources :password_resets
  
  root :to => 'calapps#index'

end
