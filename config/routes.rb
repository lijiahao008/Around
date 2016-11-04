Rails.application.routes.draw do
  
  resources :posts do 
  	resources :comments, except: [:show, :index]
  end
  resources :profiles
  devise_for :users, controllers: { registrations: "registrations",
  									omniauth_callbacks: "omniauth_callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :categories

  resources :conversations, only: [:index, :show, :destroy] do
    member do
      post :reply
      post :restore
      post :mark_as_read
      post :mark_as_unread
    end
    collection do
      delete :empty_trash
    end
  end
  resources :messages, only: [:new, :create]

  root 'posts#index'
end
