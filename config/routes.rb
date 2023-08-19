Rails.application.routes.draw do
  devise_for :users
  #devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout'}
  
  scope "(:locale)", locale: /en|uk/ do
  #scope "/:locale" do
    resources :articles, :users
    get '/about', to: 'pages#about', as: :about
    get '/service', to: 'pages#service', as: :service
    get '/contacts', to: 'pages#contacts', as: :contacts
    #get '/articles', to: 'articles#articles', as: :articles

    root 'articles#index'
  end
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #get '/:locale' => 'articles#index'
  #get '/:locale', to: "pages#about"
  #get '/:locale', to: "pages#contacts"
  #get '/:locale', to: "pages#service"

  #root "articles#index"
  #get "about", to: "pages#about"
  #get "contacts", to: "pages#contacts"
  #get "service", to: "pages#service"
 
  
  resources :articles do
    resources :comments
  end


end
