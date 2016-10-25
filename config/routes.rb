Rails.application.routes.draw do

  resources :ideas

  resources :admin do
    resources :categories, only: [:create, :destroy]
  end
  
end
