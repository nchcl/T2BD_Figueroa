Rails.application.routes.draw do
  root 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :sections do
    resources :posts do
      resources :replies
    end
    resources :admins, only: [:new, :create, :destroy, :index]
  end

  get 'sections', to: 'sections#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
