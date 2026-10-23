Rails.application.routes.draw do
  # Products
  root "products#index"
  get "products/index"
  get "products/new"
  post "products/create"
  delete "products/destroy/:id", to: "products#destroy", as: "products_destroy"

  # Carts
  get "carts/show"

  # Cart Items
  get "cart_items/new/:id", to: "cart_items#new", as: "cart_items_new"
  post "cart_items/create/:id", to: "cart_items#create", as: "cart_items_create"
  delete "cart_items/destroy/:id", to: "cart_items#destroy", as: "cart_items_destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
