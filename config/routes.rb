Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: "registrations" }
  root "home#index"

  get "dashboard" => "dashboards#show", as: "dashboard"
  get "fashionboard" => "fashionboards#show", as: "fashionboard"

  get "add_stylist/:id" => "teams#add_stylist", as: "add-stylist"

  resources :profiles
  resources :stylists,  only: [:index]
  resources :items,     only: [:new, :create]
  resources :pins,      only: [:create, :destroy]
  resources :follows,   only: [:create, :destroy]
  resources :users,     only: [:index]
  resources :teams,     only: [:show]
  resources :feedbacks, only: [:new, :create, :destroy]

   scope path: '/feeds', controller: :feeds, as: 'feed' do
    get 'user/:id', action: :user, as: :user
    get 'me', action: :user
    get 'flat', action: :flat
    get 'aggregated', action: :aggregated
    get 'notification', action: :notification
  end

end
