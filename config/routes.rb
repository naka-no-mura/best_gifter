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
      resources :rakuten_apis, only: %i[search] do
        collection do
          get 'search'
        end
      end
      resources :questionnaires do
        collection do
          get 'my_questionnaires'
        end
      end
      resources :questionnaire_choices
      resources :answers
    end
  end
  get '*path', to: 'home#index'
end
