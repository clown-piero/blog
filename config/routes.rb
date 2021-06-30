Rails.application.routes.draw do
  
  get 'users/new'
  get "users/:id" => "users#mypage"
  post "users/create" => "users#create"
  get 'static_pages/home'
  get 'static_pages/help'
  get "/" => "static_pages#top"
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  
  
end

