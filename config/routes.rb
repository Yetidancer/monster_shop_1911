Rails.application.routes.draw do
  #welcome_page
  get "/", to: "welcome#index"

  #merchants
  get "/merchants", to: "merchants#index"
  get "/merchants/new", to: "merchants#new"
  get "/merchants/:id", to: "merchants#show"
  post "/merchants", to: "merchants#create"
  get "/merchants/:id/edit", to: "merchants#edit"
  patch "/merchants/:id", to: "merchants#update"
  delete "/merchants/:id", to: "merchants#destroy"

  #items
  get "/items", to: "items#index"
  get "/items/:id", to: "items#show"
  get "/items/:id/edit", to: "items#edit"
  patch "/items/:id", to: "items#update"
  get "/merchants/:merchant_id/items", to: "items#index"
  get "/merchants/:merchant_id/items/new", to: "items#new"
  post "/merchants/:merchant_id/items", to: "items#create"
  delete "/items/:id", to: "items#destroy"

  #reviews
  get "/items/:item_id/reviews/new", to: "reviews#new"
  post "/items/:item_id/reviews", to: "reviews#create"
  get "/reviews/:id/edit", to: "reviews#edit"
  patch "/reviews/:id", to: "reviews#update"
  delete "/reviews/:id", to: "reviews#destroy"

  #cart
  post "/cart/:item_id", to: "cart#add_item"
  get "/cart", to: "cart#show"
  delete "/cart", to: "cart#empty"
  delete "/cart/:item_id", to: "cart#remove_item"
  post "/cart/:item_id/:increment_decrement", to: "cart#increment_decrement"

  #orders
  get "/orders/new", to: "orders#new"
  post "/orders", to: "orders#create"
  get "/orders/:id", to: "orders#show"

  #register/login
  get "/register", to: "users#new"
  post "/register", to: "users#create"
  get '/login', to: 'login#new'
  post '/login', to: 'login#create'
  delete '/logout', to: 'login#empty'

  #profile
  get "/profile", to: "users#show"
  get '/profile/edit', to:'users#edit'
  get '/profile/orders', to: 'user_orders#index'
  get '/profile/orders/:order_id', to: 'user_orders#show'
  patch '/profile/orders/:order_id', to: 'user_orders#update'
  patch '/profile/edit', to:'users#update'
  get '/password/edit', to:'passwords#edit'
  patch '/password/edit', to:'passwords#update'

  #dashboards
  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :merchants, only: [:index, :update, :show]
    get '/users/:user_id', to: 'user#show'
  end

  namespace :user do
    get '/', to: 'dashboard#index'
  end

  namespace :merchant do
    get '/', to: 'dashboard#index'
    get '/items', to: 'items#show'
    resources :orders, only: [:show]
  end
end
