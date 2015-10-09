Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: "registrations" }
  root "home#index"

  get "dashboard" => "dashboards#show", as: "dashboard"
  get "fashionboard" => "fashionboards#show", as: "fashionboard"
  get "adviceboard" => "adviceboards#show", as: "adviceboard"

  resources :profiles, only: [:index, :new, :create, :show, :edit]
  resources :stylists, only: [:index]
end
