Rails.application.routes.draw do
  root 'hello#index'
  get 'form_handler' => 'hello#form_handler'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
