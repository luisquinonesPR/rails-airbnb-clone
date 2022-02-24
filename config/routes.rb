Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cows, except: [ :edit, :update ] do
    resources :bookings, only: [:new, :create] do
      member do
        patch 'accept', to: "bookings#accept"
        patch 'decline', to: "bookings#decline"
      end
    end
  end
  resources :bookings, only: :index
end
