Rails.application.routes.draw do
  get 'login/index'
  get '/', to: 'main#index' 
  get 'history/index'
  get 'about/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
