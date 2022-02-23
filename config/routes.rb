Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cows, except: [ :edit, :update ] do
    resources :bookings, only: [:new, :create]
  end
  # /bookings/id/accept
  # /bookins/id/reject
  resources :bookings, only: :index
end
