Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "users/:id", to: "profiles#show", as: :show_profile

  resources :matches, only: [:update, :show] do
    collection do
      get :my_matches
    end
    resources :messages, only: :create
  end

  get "matches", to: "profiles#matches", as: :matches
  resources :matches, only: %i[update]
  post "matches", to: "matches#create", as: :create_match

  # TODO: nest doggy_dates index, new and create actions under matches
  resources :doggy_dates
  resources :dogs, only: [:create, :new, :edit, :update, :destroy]

end
