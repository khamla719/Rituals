Rails.application.routes.draw do
  resources :users do
    resources :memories
  end

  resources :sessions
  resources :share
  get '/' => 'welcome#index'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  post "/users/:user_id/memberships" => "memberships#create"
  root "welcome#index"
end
