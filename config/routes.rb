Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :caravans, only:[:new, :create, :show, :index, :destroy] do
    resources :bookings, only:[:new, :show, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
