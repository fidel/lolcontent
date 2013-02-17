Lolcontent::Application.routes.draw do

  ActiveAdmin.routes(self)
  devise_for :users, ActiveAdmin::Devise.config

  devise_for :users
  resources :users
  resources :posts

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
end
