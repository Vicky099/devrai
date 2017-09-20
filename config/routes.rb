require 'sidekiq/web'
# require 'sidekiq_status/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/admin/sidekiq_worker'
  root to: "homes#index"

  devise_for :users, :controllers => {:registrations => "registrations"}
  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
  end

  resources :homes
  namespace :admin do
    resources :gallarys
    resources :dashboards, only: [:index]
    resources :commitees
    resources :news
  end

  #custom routes

  match 'admin', to: 'admin/dashboards#index', via: :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
