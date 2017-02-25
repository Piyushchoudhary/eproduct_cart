Rails.application.routes.draw do

  namespace :admin do
    resources :categories
    resources :products
    root 'dashboard#index'
  end

  resources :categories, :only => [:show]

  delete 'cart/remove_product/:product_id' => 'carts#remove_product'

  post '/cart/add' => 'carts#add'

  get '/cart' => 'carts#show'

  get '/contact' => 'home#contact'

  get '/my_account' => 'my_account#index'

  get '/my_orders' => 'my_account#my_orders'

  get '/checkout/init' => 'checkout#index'

  post '/checkout/request_token' => 'checkout#request_authy_token'

  post '/checkout/verify_token' => 'checkout#verify_token'

  get '/checkout/order_success/:order_id' => 'checkout#order_success'

  resources :products, :only => [:show]

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
