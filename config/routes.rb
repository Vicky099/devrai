require 'sidekiq/web'
# require 'sidekiq_status/web'
Rails.application.routes.draw do

  mount Sidekiq::Web => '/admin/sidekiq_worker'
  root to: "homes#index"

  devise_for :users, :controllers => {:registrations => "registrations", :omniauth_callbacks => "users/omniauth_callbacks"}

  devise_scope :user do
    get "login", to: "devise/sessions#new"
    get "logout", to: "devise/sessions#destroy"
    match 'users', to: 'devise/sessions#new', via: :get
  end

  resources :homes
  resources :members
  namespace :admin do
    resources :gallarys
    resources :dashboards, only: [:index] do
      collection do
        get :delete_data
        get :all_users
      end
      member do
        get :make_admin
        get :suspend_user
      end
    end
    resources :commitees
    resources :news
    resources :homes
    resources :donations
  end

  resources :donations do
    member do
      get :total_donate
    end
  end
  get 'donation_list' , to: "donations#donation"
  get 'fund_list', to: "donations#fund"
  #custom routes

  match 'admin', to: 'admin/dashboards#index', via: :get
  match 'community', to: 'homes#community', via: :get
  match 'news', to: 'homes#news', via: :get

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
