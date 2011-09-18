SuitRiot::Application.routes.draw do
  
  root :to => 'images#index'
  
  resource :user_session
  match "login" => "user_sessions#new"
  match "logout" => "user_sessions#destroy"
  match "profile" => "users#show"
  
  resource :account, :controller => "users"
  resources :users
  
  resources :images
  match "submit" => "images#new"
  
  resources :votes
end