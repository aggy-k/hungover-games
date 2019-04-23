Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy]
      resources :games, only: [:index, :show, :create, :update, :destroy] do
        resources :signups, only: [:index]
      end
      resources :timeslots, only: [:index, :show, :create, :update, :destroy]
      resources :signups, only: [:show, :create, :update, :destroy]

      post '/login', to: 'login#login'
    end
  end
end
