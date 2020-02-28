Rails.application.routes.draw do
  root to: 'messages#index'
  devise_for :users
  resources :messages, only: [:index, :new, :create, :edit, :destroy, :show, :update] do
    resources :comments, only: [:create]
  end
  resources :categories, only: [:show]
  resources :users, only: [:edit, :update]
end
