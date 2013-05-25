MusicLessons::Application.routes.draw do
  get 'tags/:tag', to: 'users#show', as: :tag
  

  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end