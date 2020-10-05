Rails.application.routes.draw do
  root to: "importers#index"

  resources :importers, only: ["index", "new", "create"]
  resources :transactions, only: ["index"]
  resources :stores, only: ["index", "show"]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
