Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index]
    end
  end

  resources :items

  resources :users, only: [:index, :destroy]

  resources :homes, only: [:index]

  root "homes#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
