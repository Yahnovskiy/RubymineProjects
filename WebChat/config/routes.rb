Rails.application.routes.draw do
  get 'chat/index'

  get 'login/index'

  root 'index#index'

  get 'login' => 'login#index'
  post 'login' => 'login#login_verify'
  get 'chat' => 'chat#index'
  get 'chat_handler' => 'chat#chat_handler'
  resources :registration, only: [:index, :create]
  # get '/registration/' => 'registration#index'
  # post '/login/' => 'registration#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
