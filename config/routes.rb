Rails.application.routes.draw do
  devise_for :vendors
  devise_for :shoppers
  root 'home#index'

  resources :boats
  resources :sales_reports, only: [:index]
  resources :events
  resources :dragon_races do
    resources :placements
  end

  get 'purchase_boats', to: 'purchase_boats#index'
  get 'sale_boats', to: 'sale_boats#index'
  get 'events', to: 'events#index'
  delete '/events/:id', to: 'events#destroy'
  get 'cart', to: 'cart#index'
  get 'checkout', to: 'checkout#show'
  post 'checkout', to: 'checkout#create'
  post 'cart/add_boat/:boat_id', to: 'cart#add_boat', as: 'add_boat_to_cart'
  get 'order_confirmation/:id', to: 'orders#confirmation', as: 'order_confirmation'

  delete 'cart/remove_boat/:boat_id', to: 'cart#remove_boat', as: 'remove_boat_from_cart'

  post 'boats/restock/:id', to: 'boats#restock', as: 'restock_boat'

  resources :boats do
    resources :reviews, only: [:create]  # Nested route for creating reviews
  end
  
end
