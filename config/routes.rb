Calapps::Application.routes.draw do
  get "password_resets/new"

  #get "welcome/contact"
  get "welcome/about"
  get "welcome/success"
  get "welcome/construction"
  get "users/new"
  get 'tags/:tag', to: 'calapps#index', as: :tag
  #get '/category/Academic' to: 'calapps#category' as: :tag

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', :to => 'sessions#destroy',     via: :delete
  match 'contact' => 'contact#new', :as => 'contact', :via => :get
  match '/contact' => 'contact#create', :as => 'contact', :via => :post
  match '/gallery', to: 'calapps#gallery', via: 'get'
  match '/list', to: 'calapps#alphabetize', via: 'get'
  match '/category/:category', to: 'calapps#category', via: 'get'

  #match 'calapp/about/:id' => 'calapps#show', :as => :calapp

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
  resources :users
  resources :calapps do 
    resources :reviews, :only => [:create, :new, :destroy]
  end
  resources :sessions
  resources :password_resets
  
  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'
  root :to => 'calapps#gallery'



  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
