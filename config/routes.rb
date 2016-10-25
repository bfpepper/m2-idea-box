Rails.application.routes.draw do

  root to: "ideas#index"

  resources :ideas

  namespace :admin do
    resources :dashboard, only: [:index]
    resources :categories, only: [:new, :create, :destroy]
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

end
