MusicLessons::Application.routes.draw do
<<<<<<< HEAD
  get "landing_page/index"
=======
  
  resources :messages do
    get :autocomplete_user_name, :on => :collection
    member do
      post :remove_recipient
      post :remove_sender
    end
  end

  match '/inbox' => 'messages#index'
  match '/sent' => 'messages#sent'
  match '/trash' => 'messages#trash'
  match '/admin' => 'admin#index'
>>>>>>> 4e1d2562cf5d7a3b3818fd34aaebd632024f5e2b

match 'teacher_list' => 'teacher_list#index'
get 'tags/:tag', to: 'users#show', as: :tag
authenticated :user do
root :to => 'home#index'
end
root :to => "home#index"
devise_for :users
resources :users do
resources :events
end
match "/auth/google_login/callback" => "sessions#create"
match "/signout" => "sessions#destroy", :as => :signout
end