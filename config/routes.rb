Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations"}
      resources :users, only: [:index, :show] do
    resources :orders, only: [:index]
  end

  resources :products do
    resources :orders, only: [:new, :create, :show]
  end

  resources :orders, only: [:destroy]

  root to: 'pages#home'
end
