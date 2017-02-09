Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :items do
        post "/selected", to: 'items#selected'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      resources :things, only: [:index]
    end
  end  


  resources :items
  post "/items/:id/selected", to: 'items#selected'

  resources :things


  resources :items do
    resources :reviews
  end

  resources :users, only: [:index, :show, :edit, :destroy]

  resources :homes, only: [:index]

  root "homes#index"
end
