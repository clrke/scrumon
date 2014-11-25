Rails.application.routes.draw do
  root 'sessions#new'

  get 'users/new'
  get 'users/show'

  get 'sessions/new'
  post 'sessions/create'
  post 'sessions/destroy'

  resources :organizations
end
