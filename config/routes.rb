Rails.application.routes.draw do
  root to: 'tasks#index'
  post '/', to:'tasks#index'
  get 'users/:id', to:'tasks#index', as: :user
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  #put 'tasks/:id', to: 'tasks#update'
  
  resources :tasks# #only: [:index, :new, :create, :destroy, :show, :edit,:update]#
  resources :users, only: [:index, :create] #:new,
end
