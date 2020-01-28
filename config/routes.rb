Rails.application.routes.draw do
  devise_for :users
  root to: 'messages#index'
  resources :messages, only: [:index, :new, :create, :edit, :destroy, :show, :update] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:show]
  resources :users, only: [:edit, :update]
end
