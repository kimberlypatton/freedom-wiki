Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root 'welcome#index'

  resources :groups

  resources :articles

  resources :users

  # auth routes
  get '/sign-up' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
