Cms::Engine.routes.draw do
  resources :pages
  resources :photos
  resources :nav_menus do
    resources :nav_items
  end
  
  resources :users do
    member do
      get :change_password
    end
  end
  resources :sessions, :only => [:create]

  match '/', :to => 'admin#home', :as => :cms
  match '/home', :to => 'admin#home', :as => :admin_home
  match '/signin', :to => 'sessions#new', :as => :signin
  match '/signout', :to => 'sessions#destroy', :as => :signout
  
  post "/nav_menus/order_nav_items", :to => 'nav_menus#order_nav_items', :as => :order_nav_items

  # Routes in the host application
  get '../pages/:id', :to => 'pages#show', :as => :host_page
  match '../media/:file_name', :to => Dragonfly[:images]  
end

Rails.application.routes.draw do
  
  # Routes in the host application
  get '/pages/:id', :to => 'pages#show', :as => :host_page  
  match '/media/:file_name', :to => Dragonfly[:images]
  match '/', :to => 'pages#home', :as => :root
  match '/test', :to => 'pages#test', :as => :test
end