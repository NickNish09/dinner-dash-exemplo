Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :meals
  resources :meal_categories
  resources :all_users
  resources :orders
  resources :order_meals
  
  

  put '/add', to: 'cart#add_item', as: 'add'
  put '/remove', to: 'cart#remove_item', as: 'remove'
  put '/make', to: 'order_meals#make', as: 'make'



end
