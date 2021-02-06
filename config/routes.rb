Rails.application.routes.draw do
  root 'home#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :sessions
      resources :users do
        collection do
          get 'me'
        end
      end
    end
  end
  resources :key, only: [:index]
  get '*path', to: 'home#index'
end
