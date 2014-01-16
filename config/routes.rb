Pong::Application.routes.draw do
  resources :achievements, only: [:index, :show]
  resources :matches do
    collection do
      get 'rankings'
      get 'players'
    end
  end
  resources :posts, only: [:index]
  resources :players, only: [:show, :update] do
    collection do
      get 'odds'
    end
  end
  resources :stats, only: [:index]
  resource :api do
    member do
      get 'tweet'
    end
  end

  namespace :admin do
    root to: 'posts#index'
    resources :posts
    resources :players
    resources :matches
    resources :site_settings, only: [:index] do
      collection do
        post 'group'
        get 'restore_defaults'
      end
    end
  end
  root to: 'matches#rankings'
end
