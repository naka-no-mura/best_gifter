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
      resources :items do
        collection do
          get :favorites
        end
      end
      resources :rakuten_apis, only: %[search] do
        collection do
          get 'search'
        end
      end
      resource :favorites, only: %[create destroy]
    end
  end
  get '*path', to: 'home#index'
end
