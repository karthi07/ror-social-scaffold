Rails.application.routes.draw do

  get 'invitation/create'
  get 'invitation/destroy'
  root 'posts#index'

  devise_for :users

  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :create] do
    resources :comments, only: [:create]
    resources :likes, only: [:create, :destroy]  
  end
  
  resources :invitations, only: [:create, :destroy]
  post 'add_friend', to: 'invitations#create'
  

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
