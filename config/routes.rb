Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:index, :show, :create, :update, :destroy] do
        resources :signups, only: [:index] # For display in "Your games" tab
      end
      resources :games, only: [:index, :show, :create, :update, :destroy]

      get 'games/:id/usersignups', to: 'games#show_user_signups'

      resources :timeslots, only: [:index, :show, :create, :update, :destroy]
      resources :signups, only: [:show, :create, :update, :destroy]

      put '/signupcancel', to: 'signups#cancel_signup'
      resources :game_statuses, only: [:index]

      resources :game_rules, only: [:index, :create]

      post '/login', to: 'login#login'
      get '/access', to: 'access#access'

    end
  end

  get "/pages/:page" => "pages#home"
  root to: "pages#index"
end
