Rails.application.routes.draw do
  root 'home#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :rakuten_searches, only: [:search] do
        collection do
          get 'search'
        end
      end
    end
  end
  get '*path', to: 'home#index'
  resources :gon
end
