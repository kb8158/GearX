Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :items, only: [:index]
    end
  end

  resources :items
  post "/items/:id/selected", to: 'items#selected'


  resources :users, only: [:index, :show, :edit, :destroy]

  resources :homes, only: [:index]

  root "homes#index"
end
