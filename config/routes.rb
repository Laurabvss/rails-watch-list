Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  #get 'lists', to: 'lists#index', as: :lists
  #get 'lists/new', to: 'lists#new', as: :new_list
  #get 'lists/:id', to: 'lists#show', as: :list
  #post 'lists', to: 'lists#create'

  #get 'lists/:id/bookmarks/new', to: 'bookmarks#new', as: :new_bookmark
  #post 'lists/:id/bookmarks', to: 'bookmarks#create'

  root to: "lists#index"
  # get 'lists/:id', to: 'lists#show', as: :movie
  resources :lists do
    resources :bookmarks, only: %i[new create]
  end
  resources :bookmarks, only: %i[destroy]
end
