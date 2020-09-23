Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}

  resources :products do
    resources :orders, only: [:new, :create]
  end

  resources :orders, only: [:destroy]

  root to: 'pages#home'
end
