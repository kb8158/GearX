Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :bits, only: [:index]
      resources :elements, only: [:index]
    end
  end

  resources :bits
  resources :elements

  resources :users, only: [:index, :destroy]

  resources :homes, only: [:index]

  root "homes#index"
end
