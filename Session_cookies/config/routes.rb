Rails.application.routes.draw do
  root 'hello#index'
  get 'hello_handler' => 'hello#hello_handler'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #вызввается метод индекс который выдает индекс штмл
end
