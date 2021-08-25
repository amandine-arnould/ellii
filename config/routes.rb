Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get "/dashboard", to: "pages#dashboard"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :bookings, only: [:new, :create]
    resources :sessions, only: [:index, :new, :create], as: :activity_session
  end
  resources :bookings, only: [:index, :destroy]
  resources :sessions, only: [:show, :edit, :update, :destroy], as: :activity_session
end
