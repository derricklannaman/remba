Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: "registrations" }
  root "home#index"

  get "dashboard" => "dashboards#show", as: "dashboard"
  get "fashionboard" => "fashionboards#show", as: "fashionboard"
  get "adviceboard" => "adviceboards#show", as: "adviceboard"

  get "add_stylist/:id" => "teams#add_stylist", as: "add-stylist"

  resources :profiles, only: [:index, :new, :create, :show, :edit]
  resources :stylists, only: [:index]
  resources :items, only: [:new, :create]
end
