require 'sidekiq/web'

Rails.application.routes.draw do
  
  resources :profiles do
    resources :messages
  end
  
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  get '/privacy', to: 'home#privacy'
  get '/home', to: 'home#index'
  
authenticate :user, lambda { |u| u.admin? } do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount Sidekiq::Web => '/sidekiq'

  namespace :madmin do
    resources :impersonates do
      post :impersonate, on: :member
      post :stop_impersonating, on: :collection
    end
  end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # post "profile/message" => "profiles#email_profile", as: :email_profile
end
