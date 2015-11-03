Rails.application.routes.draw do

  get 'downloads/exe'

  match '/contacts',  to: 'static_pages#contacts',    via: 'get'
  match '/history',   to: 'static_pages#history',     via: 'get'
  match '/checkflash',to: 'static_pages#checkflash',   via: 'get'

  resources :orders
  resources :addservices, only: :index
  resources :blogposts, only: [:show, :index]
  resources :donwloads

  resources :products do
    resources :servizations
    resources :colors
    resources :options do
      resources :option_pics
    end
  end

  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :products do
      resources :images
    end
    resources :blogposts
    resources :categories
    resources :subcategories
    resources :volumes
    resources :members
    resources :addservices
    resources :settings
    resources :deliveries
    resources :colors
    get 'accompanships/create'
    delete 'accompanships/destroy'

  end

  
  resources :carts
  resources :categories
  resources :deliveries
  resources :line_items do
    put :sellprice, on: :member
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'store_front#index'

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
