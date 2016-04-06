Rails.application.routes.draw do
  resources :users do
    resources :memories
    resources :memberships
  end
  resources :sessions
  resources :share
  get '/' => 'welcome#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'

  root "welcome#index"
end
