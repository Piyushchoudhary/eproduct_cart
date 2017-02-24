Rails.application.routes.draw do

  namespace :admin do
    resources :categories
    resources :products
    root 'dashboard#index'
  end

  resources :categories, :only => [:show]

  post '/cart/add' => 'carts#add'

  get '/cart' => 'carts#show'

  get '/contact' => 'home#contact'

  get '/my_account' => 'my_account#index'

  get '/my_orders' => 'my_account#my_orders'

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      passwords: 'users/passwords',
      registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
