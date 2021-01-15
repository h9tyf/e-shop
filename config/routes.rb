Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/home', to: 'home#index'


  resources :shops do
    resources :products do
      resources :product_options
    end
  end

  resources :favorites
  resources :carts

  resources :my_transactions do
    resources :transaction_product_tables
  end

  resources :solds
end
