Rails.application.routes.draw do
  root to: 'tasks#index'
  #get 'users/:id', to:'tasks#index', as: :user
  
  get 'login', to: 'sessions#new' #ログアウトしたときに必要
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  resources :tasks
  resources :users, only: [:new, :create] 
  
end
