Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/help'
  resources :blogcontents
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "hello" => "application#hello"
  
end

