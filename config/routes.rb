Blocitoff::Application.routes.draw do
  resources :lists

  # get 'items/index'

  # get 'items/show'

  # get 'items/create'

  # get 'items/new'

  # get 'items/edit'





  devise_for :users
  resources :users, only: [:update, :show]

  resources :lists do
    resources :items, only: [:create, :destroy]
  end
  
  authenticated :user do
    root to: "users#show", as: :authenticated_root, via: :get
  end

  unauthenticated :user do
    root 'welcome#index'
  end
end