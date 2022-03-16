Rails.application.routes.draw do
  devise_for :users
  root 'application#index'

  resources :groups do
    resources :expenses
  end
end
