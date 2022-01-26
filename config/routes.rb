Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, shallow: true
      # post 'add_comment', to: 'comments#create', on: :member
      # delete 'delete_comment/:comment_id', to: 'comments#destroy', on: :member, as: 'delete_comment'
      post 'add_like', to: 'likes#create', on: :member
    end
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
