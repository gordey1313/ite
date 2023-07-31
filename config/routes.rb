Rails.application.routes.draw do
  #devise_for :users
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "articles#index"
  get "about", to: "about#index"
  
  resources :articles do
    resources :comments
  end

end
