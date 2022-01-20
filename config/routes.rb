Rails.application.routes.draw do
  root 'home#index'
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
