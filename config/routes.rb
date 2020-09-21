Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  devise_for :users
  # get "users/:id" => "users#show", as: :mypage
  get "home" => 'homes#top'
  get "home/about"  => 'homes#about'

  root 'homes#top'
  # resources :books, only: [:new, :create, :index, :show]
  resources :books do
     resource :favorites, only: [:create, :destroy]
  	 resources :post_comments, only: [:create, :destroy]
  end

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end


