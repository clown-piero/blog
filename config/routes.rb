Rails.application.routes.draw do
  
  get 'users/new'
  get "users/login_form" => "users#login_form"
  get "users/:id" => "users#mypage"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/create" => "users#create"
  get 'static_pages/home'
  get 'static_pages/help'
  get "/" => "static_pages#top"
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  
  
end

