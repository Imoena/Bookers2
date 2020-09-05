Rails.application.routes.draw do
  devise_for :users
  root 'books#index'
  # resources :books, only: [:new, :creste, :index, :show]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
