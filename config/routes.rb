Rails.application.routes.draw do
  root 'home#index'

  resources :users, except: [:respueston, :publicon]
  resources :sessions, only: [:new, :create, :destroy]
  resources :sections do
    resources :posts do
      resources :replies
      resources :users, only: :respueston
    end
    resources :admins, only: [:new, :create, :destroy, :index]
    resources :users, only: :publicon
  end

  get 'sections', to: 'sections#index'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:id/delavatar', to: 'users#delavatar', as: 'delavatar_user', method: 'put'
  get '/sections/:section_id/posts/:id/like', to: 'posts#like', as: 'section_post_like', method: 'put'
  get '/sections/:section_id/posts/:id/dislike', to: 'posts#dislike', as: 'section_post_dislike', method: 'put'
  get '/sections/:section_id/posts/:post_id/:id', to: 'users#respueston', as: 'section_post_user', method: 'put'
  get '/sections/:section_id/users/:id', to: 'users#publicon', as: 'section_user', method: 'put'
end
