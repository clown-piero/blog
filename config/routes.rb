Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  get "/" => "static_pages#top"
  
  resources :blogcontents
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "hello" => "application#hello"
  get "users/new" => "users#new"
  
  
end

