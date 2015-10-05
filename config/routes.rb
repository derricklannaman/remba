Rails.application.routes.draw do

  devise_for :users, :controllers => { registrations: "registrations" }
  root "home#index"

  get "dashboard" => "dashboards#show", as: "dashboard"
  get "fashionboard" => "fashionboards#show", as: "fashionboard"

  resources :profiles, only: [:index, :new, :create, :show, :edit]

end
