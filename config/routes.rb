GroceryPricer::Application.routes.draw do
  devise_for :users

  resources :stores do
    resources :store_products, only: [:new, :update]
    resources :store_reviews, only: :new
  end

  resources :products do
    resources :store_products, only: :new
    resources :product_reviews, only: :new
    member do
      delete :remove_from_list
    end
  end

  resources :users

  resources :user_products

  resources :store_products
  resources :store_reviews
  resources :product_reviews

  root to: 'stores#index'
end
