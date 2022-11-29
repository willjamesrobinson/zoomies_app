Rails.application.routes.draw do
  devise_for :users
  root to: "owners#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # TODO: nest doggy_dates index, new and create actions under matches
  resources :doggy_dates
end
