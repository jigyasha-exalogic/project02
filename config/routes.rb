Rails.application.routes.draw do
  root "sessions#index"
  resources :sessions, only: [:index, :create]
  delete '/logout' => "sessions#destroy", as: 'logout'
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
