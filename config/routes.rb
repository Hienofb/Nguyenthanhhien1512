require 'sidekiq/web'

Rails.application.routes.draw do
  resources :books
  resources :authors
  authenticate :user, ->(u) { u.admin? } do
    mount Sidekiq::Web => '/sidekiq'
    resources :books
    resources :authors
  end


  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  

end
