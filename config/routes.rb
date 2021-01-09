Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    resources :items do
      collection do
        get 'search'
      end
    end
  end
  get '*path', to: 'home#index'
end
