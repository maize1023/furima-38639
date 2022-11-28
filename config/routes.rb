Rails.application.routes.draw do
  devise_for :users
  root "items#index"
  resources :items, only: [:update]
  resources :items do
    resources :purchase_records, only: [:create, :index]
  end
end
