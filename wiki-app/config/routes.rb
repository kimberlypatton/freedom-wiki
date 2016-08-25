Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'welcome#index'

  resources :groups do
    resources :memberships, only: [:create, :destroy, :update]
  end

  resources :users do
    resources :memberships, only: [:destroy, :create]
  end

  # resources :users do
  #   resources :groups, only: [:create, :destroy, :index]
  # end

  # resources :groups do
  #   resources :users, only: [:create, :destroy, :index]
  # end

  resources :articles

  get '/profile' => 'users#show'

  # auth routes
  get '/sign-up' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
