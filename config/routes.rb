Rails.application.routes.draw do

  get 'dashboards/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars  do
    resources :bookings, only: [:new, :create]
    resources :dashboards, only: [:index, :show, :edit, :update, :destroy]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
 
end
