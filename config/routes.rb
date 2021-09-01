Rails.application.routes.draw do
  begin
    ActiveAdmin.routes(self)
  rescue Exception => e
    puts "ActiveAdmin: #{e.class}: #{e}"
  end

  devise_for :users
  root to: "pages#home"
  get "/dashboard", to: "pages#dashboard"
  resources :moods, only: [:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :activities do
    resources :sessions, only: [:index, :new, :create], as: :activity_session do
      resources :bookings, only: [:new]
    end
  end

  resources :bookings, only: [:create, :index, :destroy, :show, :update] do
    patch :add_comment, on: :collection
    patch :add_score, on: :member
  end

  resources :sessions, only: [:show, :edit, :update, :destroy], as: :activity_session do
    resources :messages, only: :create
    member do
      get :start, :end
      get :slots, to: 'sessions#slots'
    end
  end
end
