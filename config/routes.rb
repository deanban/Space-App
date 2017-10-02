Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :curiosities
  resources :users
  post '/login', to: 'auth#create'
  get '/welcome', to: 'application#welcome'
  post '/users/:id/likes/', to: 'users#addLike'



end
