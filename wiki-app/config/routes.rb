Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'welcome#index'

  resources :groups do
    resources :categories, shallow: true
    resources :articles, shallow: true
    resources :memberships, only: [:create, :destroy, :update]
  end

  resources :users do
    resources :memberships, only: [:destroy, :create]
  end

  get '/profile' => 'users#show'

  # auth routes
  get '/sign-up' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get '/search' => 'articles#search'

end
