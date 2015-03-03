Rails.application.routes.draw do
  resources :players, only: [:index, :show, :create, :new]

  resources :clubs, only: [:new, :create, :show] do
    scope module: 'clubs' do
      resources :games, only: [:index, :new, :create, :show, :destroy]
    end
  end

  resources :memberships, only: [:create]

  root 'homepage#show'
end
