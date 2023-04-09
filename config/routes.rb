Rails.application.routes.draw do
  delete 'logout', to: 'sessions#destroy'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'login/index'
  root to: 'main#index' 
  get 'history/index'
  get 'about/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
