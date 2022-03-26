Rails.application.routes.draw do
  devise_for :users
  root 'application#index'

  resources :groups, only: [ :index, :create, :new ] do
    resources :expenses, only: [ :index, :create, :new ]
  end
end
