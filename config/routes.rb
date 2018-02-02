Rails.application.routes.draw do
  devise_for :users
  
  root to: 'home#index'
  resources :conversations, only: [:create] do
    member do
      post :close
    end
    
    resources :messages, only: :create
  end
end
