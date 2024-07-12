Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :inventories, only: %i[index]
      resources :stores, only: %i[index]
      put "/inventories/:id", to: "inventories#update"
    end
  end
end
