Rails.application.routes.draw do

  namespace :admin do
    resources :products
  end
  namespace :admin do
    resources :categories
    root 'dashboard#index'
  end

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
