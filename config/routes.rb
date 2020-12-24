Rails.application.routes.draw do
  root to: 'tasks#index'
  #post '/', to:'tasks#index' 
  get 'users/:id', to:'tasks#index', as: :user
  
  get 'login', to: 'sessions#new' #ログアウトしたときに必要
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  
  resources :tasks
  resources :users, only: [:create] #:index
  
  #put 'tasks/:id', to: 'tasks#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
end
