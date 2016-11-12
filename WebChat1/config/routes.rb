Rails.application.routes.draw do
  get 'login/index'

  root 'index#index'

  get 'login' => 'login#index'
  post 'login' => 'login#login_verify'

  # resources :registration, only: [:index, :create]
  # get '/login/' => 'Login#index'
  # post '/login/' => 'Login#create'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
