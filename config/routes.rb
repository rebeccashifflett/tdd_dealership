Rails.application.routes.draw do
  root 'dealerships#index'

  resources :dealerships do
    resources :cars
  end
end
