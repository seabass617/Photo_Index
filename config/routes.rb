Rails.application.routes.draw do
  devise_for :users

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :albums, only: %i[index show update create destroy] do
        resources :photos, only: %i[index show create]
      end
      resources :photos, only: %i[destroy update]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
