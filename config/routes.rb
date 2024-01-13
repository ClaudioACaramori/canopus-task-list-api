Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

  namespace :api do
    namespace :v1 do
      resources :task_items, only: [:index, :create, :update, :destroy]
      resources :categories, only: [:index, :create, :update, :destroy]
      resources :users, only: [:show, :create, :update, :destroy, :index] do
        collection do
          post :sign_in, controller: :sessions, action: :create
        end
      end
    end
  end
end
