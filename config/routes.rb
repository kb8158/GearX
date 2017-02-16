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
      resources :things do
        post "/chosen", to: 'things#chosen'
      end
    end
  end

  authenticate :user do
    resources :items
    resources :things
  end

  resources :items
  post "/items/:id/selected", to: 'items#selected'

  resources :things
  post "/things/:id/chosen", to: "things#chosen"


  resources :items do
    resources :reviews
  end

  resources :users, only: [:index, :show, :edit, :destroy]

  resources :homes, only: [:index]

  root "homes#index"
end
