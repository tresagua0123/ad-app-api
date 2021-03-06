Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/login', to: 'firebase#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  post   '/accounts', to: 'accounts#create'
  delete '/accounts', to: 'accounts#destroy'

  resources :users, only: :index
end
