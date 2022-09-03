Rails.application.routes.draw do
  devise_for :users  
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :shoping_lists, only: [:index]
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    resources :recipe_foods, only: [:create, :destroy, :new]
  end
  resources :public_recipes, only: [:index]

  match 'recipes/:recipe_id' => 'recipes#toggle_public', as: :toggle_public, via: :patch

  # Defines the root path route ("/")
  root "public_recipes#index"
end
