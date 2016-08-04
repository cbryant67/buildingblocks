Rails.application.routes.draw do
  get 'order_items/create'

  get 'order_items/update'

  get 'order_items/destroy'

  get 'carts/show'

  get 'products/index'

  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  root to: "products#index"

  devise_for :users
   devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  mount Ckeditor::Engine => "/ckeditor"
  resources :posts

  
  match '/contacts',     to: 'contacts#new',             via: 'get'
  resources "contacts", only: [:new, :create]


  
  get '/home' => 'pages#home'

  get '/about' => 'pages#about'

  get '/ourwork' => 'posts#index'

  get '/contact' => 'contacts#new'

  get '/store' => 'pages#store'

  #root 'pages#home'

  #get '*path' => redirect('/')


end
