Rails.application.routes.draw do

  resources :api_keys
  resources :mapas
  resources :mapas
  resources :mapas
  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :estadisticas
      resources :alumnos
      get "mapa" => "mapas#show"
    end
    namespace :v2 do
      post "estadisticas" => "estadisticas#create"
      post "alumnos" => "alumnos#create"
      get "mapa" => "mapas#show"
    end

  end

  resources :alumnos
  resources :estadisticas

  root 'dashboard#index'

  devise_for :users
  devise_scope :user do
    get "/login" => "devise/sessions#new"
  end

  resources :users
  

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
