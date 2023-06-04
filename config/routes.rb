Rails.application.routes.draw do
  resources :titles
  resources :posts
  resources :zadania, only: [:index, :show] do
    collection do
      post :zadanie8
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
