Rails.application.routes.draw do
  devise_for :users

  resources :chatrooms do
    resource :chatroom_users
  end

  root 'chatrooms#index'
end
