Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users
  resources :messages
  resources :classrooms

  post "/login", to: "sessions#login"

  mount ActionCable.server => '/cable'

end
