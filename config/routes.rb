Rails.application.routes.draw do
  devise_for :users
  # get "users/:id" => "users#show", as: :mypage
  get "home" => 'homes#top'
  get "home/about"  => 'homes#about'

  root 'homes#top'
  # resources :books, only: [:new, :create, :index, :show]
  resources :books

  resources :users  #, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end


