MusicLessons::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  match "/auth/google_login/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout
end