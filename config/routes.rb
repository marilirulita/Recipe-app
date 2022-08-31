Rails.application.routes.draw do
  get 'shoping_lists/index'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    resources :foods
  end
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  # Defines the root path route ("/")
  root "users#index"
end
