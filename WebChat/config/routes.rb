Rails.application.routes.draw do


  root 'index#index'

  get 'login' => 'login#index'
  post 'login' => 'login#login_verify'
  get 'logout' => 'logout#index'

  resources :admin
  # get 'admin' => 'admin#index'

  get 'chat' => 'chat#index'
  get 'chat_handler' => 'chat#chat_handler'

  resources :registration, only: [:index, :create]
  # get 'registration' => 'registration#index'
  # post 'registration' => 'registration#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
