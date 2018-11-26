Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :messages
  resources :classrooms
<<<<<<< HEAD

  mount ActionCable.server => '/cable'

  get '/test_sockets/:id', to: 'users#test_sockets'
=======
  mount ActionCable.server => '/cable'

>>>>>>> adding_action_cables
end
