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

  resources :users
  
  resources :calapps do
    collection do
      get 'search'
      get 'feed'
    end
    member do
      put 'archive'
      put 'approve'
    end
    resources :reviews, :only => [:create, :new, :destroy]
  end
  
  resources :sessions
  resources :password_resets
  
  root :to => 'calapps#index'

end
