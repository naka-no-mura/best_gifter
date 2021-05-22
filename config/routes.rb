Rails.application.routes.draw do
  root 'home#index'
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :sessions, only: %i[create]
      resources :users, only: %i[create] do
        collection do
          get 'me'
        end
      end
      resources :items, only: %i[index destroy create] do
        collection do
          get :favorites
        end
      end
      resources :rakuten_apis, only: %i[search] do
        collection do
          get 'search'
        end
      end
      resources :questionnaires, only: %i[index create destroy show] do
        collection do
          get 'my_questionnaires'
        end
      end
      resources :questionnaire_choices, only: %i[index create]
      resources :answers, only: %i[index create]
    end
  end
  get '*path', to: 'home#index'
end
