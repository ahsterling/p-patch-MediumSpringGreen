require 'resque/server'

Rails.application.routes.draw do

  mount Resque::Server, :at => "/resque"

  get "/auth/:developer/callback", to: "users#create_with_twitter"
  post "/auth/:developer/callback", to: "users#create_with_twitter"
  get "/users/twitter_confirm", to: "users#confirm_with_twitter"
  put "/users/twitter_confirm", to: "users#finalize_twitter"



  get  "/events",          to: "events#index", as: :events
  get  "/events/new",      to: "events#new"
  post "/events",          to: "events#create"
  get  "/events/:id/show", to: "events#show", as: :show_event





  get    "/events/:id/edit",  to: "events#edit",    as: :event
  post   "/events/:id/edit",  to: "events#edit"
  # patch  "/events/:id/edit",      to: "events#edit"

  put    "/events/:id",      to: "events#update"
  patch  "/events/:id/edit",      to: "events#update"






  get "/users/new",            to: "users#new", as: :users
  post "/users/new",           to: "users#create"

  get "/users/show",       to: "users#show", as: :user

  get    "/users/:id/edit",  to: "users#edit"
  post   "/users/:id/edit",  to: "users#edit"

  put    "/users/:id/",      to: "users#update"
  patch  "/users/show",      to: "users#update"

  get "/users/show", to: "users#request_admin_mail", as: :admin_req
  post "/users/show", to: "users#request_admin_mail"


  delete "/",         to: "home#destroy", as: :logout

  get "home/login",   to: "home#login", as: :login
  post "home/login",   to: "home#login"

  get "/tools",       to: "tools#index", as: :tools
  post "/tools/:id",   to: "tools#update", as: :tool

  get "/posts",       to: "posts#index", as: :posts
  get  "/posts/new",  to: "posts#new", as: :new_post
  get "/posts/:id/edit", to: "posts#edit", as: :edit_post
  get "/posts/:id",   to: "posts#show", as: :post
  put "/posts/:id",   to: "posts#update"
  delete "/posts/:id", to: "posts#destroy", as: :delete_post
  post "/posts",      to: "posts#create"


  root "home#index"





  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
