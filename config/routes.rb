Rails.application.routes.draw do

  resources :users
  resources :sessions,   only: [:new, :create, :destroy]
  resources :answers, only: [:create, :destroy]  
  resources :questions, only: [:create, :destroy]  
  root  'static_pages#home'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'

end
