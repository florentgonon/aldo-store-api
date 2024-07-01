Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :inventories, only: %i[index]
      put "/inventories/:id", to: "inventories#update"
      scope module: :stores, path: "/stores/:store_id", as: :store do
        resources :inventories, only: %i[index show]
      end
    end
  end
end
