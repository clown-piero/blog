Rails.application.routes.draw do
  
  get 'blogtexts/new'
  get 'users/new'
  get "users/login_form" => "users#login_form"
  get "users/:id" => "users#mypage"
  get "users/:id/edit" => "users#edit"
  get "users/:id/likes" => "users#likes"
  post "users/:id/update" => "users#update"
  post "login" => "users#login"
  post "logout" => "users#logout"
  post "users/create" => "users#create"
  get 'static_pages/home'
  get 'static_pages/help'
  get "/" => "static_pages#top"
  get "blogtexts/new" => "blogtexts#new"
  get "blogtexts/show" => "blogtexts#show"
  get "blogtexts/:id" => "blogtexts#details"
  post "blogtexts/create" => "blogtexts#create"
  post "blogtexts/:id/destroy" => "blogtexts#destroy"
  post "likes/:post_id/favorite" => "likes#favorite"
  post "likes/:post_id/destroy" => "likes#destroy"
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  
  
end

