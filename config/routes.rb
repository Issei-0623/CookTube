Rails.application.routes.draw do
  get "searches/index"
  get "folders/index"
  get "folders/new"
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check

  root to: "home#index"

  resource :mypage, controller: :mypages, only: [:show, :edit, :update] do
    patch :avatar_update, on: :collection
    delete :avatar_destroy, on: :collection
  end

  resources :saved_videos, only: [:index, :create, :destroy, :update]
  resources :folders, only: [:index, :create, :edit, :update, :destroy, :show]
  resources :searches, only: [:index, :create]
end
