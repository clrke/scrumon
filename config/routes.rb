Rails.application.routes.draw do
  post 'tasks/create'
  post 'tasks/assign'

  root 'sessions#new'

  get 'users/new'
  get 'users/show'
  post 'users/create'
  post 'users/join'
  delete 'users/leave'

  get 'sessions/new'
  post 'sessions/create'
  post 'sessions/destroy'

  resources :organizations
end
