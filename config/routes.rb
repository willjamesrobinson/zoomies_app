Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "users", to: "profiles#index", as: :index_profile
  get "users/:id", to: "profiles#show", as: :show_profile

  # TODO: nest doggy_dates index, new and create actions under matches
  resources :doggy_dates
  resources :dogs, only: [:create, :new, :edit, :update, :destroy]

end
