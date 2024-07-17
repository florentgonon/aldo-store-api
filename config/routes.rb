Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :inventories, only: %i[index update]
      resources :transfers, only: %i[create]
      resources :stores, :shoes, only: %i[index]
      scope module: :stores, path: "/stores/:store_id", as: :store do
        resources :inventories, only: %i[index]
      end
    end
  end
end
