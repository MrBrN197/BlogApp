Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      post 'add_comment', to: 'comments#create', on: :member
      post 'delete_comment' to: 'comments#destroy', on: :member
      post 'add_like', to: 'likes#create', on: :member
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
