Rails.application.routes.draw do
  root 'home#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :rakuten_searches, only: [:search, :index] do
        collection do
          get 'search'
        end
      end
    end
  end
  resources :key, only: [:index]
  get '*path', to: 'home#index'
end
