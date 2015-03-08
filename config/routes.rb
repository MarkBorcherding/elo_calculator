Rails.application.routes.draw do
  resources :players, only: [:index, :show, :create, :new]
  resources :games, only: [:index, :new, :create, :show, :destroy]
  resources :clubs, only: [:index, :new, :create, :show]

  resources :memberships, only: [:new, :create]

  root 'homepage#show'
end
