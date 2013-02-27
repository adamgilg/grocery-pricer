GroceryPricer::Application.routes.draw do
  devise_for :users

  resources :stores do
    resources :store_products, only: [:index, :new]
    resources :store_reviews, only: [:index, :new]
  end

  resources :products do
    resources :store_products, only: [:index, :new]
    resources :product_reviews, only: [:index, :new]
  end

  resources :store_products
  resources :users
  resources :store_reviews
  resources :product_reviews

  root to: 'stores#index'
end
