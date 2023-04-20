Rails.application.routes.draw do
  resources :books
  get 'password/reset', to: 'password_reset#new', as: :password_reset
  post 'password/reset', to: 'password_reset#create'
  get 'password/reset/edit', to: 'password_reset#edit'
  patch 'password/reset/edit', to: 'password_reset#update'
  get 'password', to: 'password#edit', as: :edit_password
  patch 'password', to: 'password#update'
  delete 'logout', to: 'sessions#destroy'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'login/index'
  root to: 'books#index' 
  get 'history/index'
  get 'about/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
