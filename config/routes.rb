Rails.application.routes.draw do
  devise_for :users
  root to: "posts#index"
  resources :users, only: [:index, :show, :edit, :update]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
  end
end
