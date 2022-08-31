Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :foods
    resources :shoping_list, only: [:index]
  end
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  # Defines the root path route ("/")
  root "users#index"
end
