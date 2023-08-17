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

  resources :lists, only: [:index, :new, :create, :show] do
    member do
      get 'lists/:id/bookmarks/new', to: 'bookmarks#new', as: :new_bookmark
      post 'lists/:id/bookmarks', to: 'bookmarks#create'
    end
    resources :bookmarks, only: %i[new create]
  end
  root to: 'lists#index'
  delete 'bookmarks/:id', to: 'bookmarks#destroy'
end
