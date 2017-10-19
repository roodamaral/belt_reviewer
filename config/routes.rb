Rails.application.routes.draw do

  root 'users#new'

  get 'events' => 'events#index' 

  get 'show/:id' => 'events#show'

  get 'edit/:id' => 'events#edit'

  get 'users/new'

  get 'users/show/:id' => 'users#show'

  post 'users/create' => 'users#create'

  post 'users/update' => 'users#update'

  post 'users/destroy' => 'users#destroy'

  get 'events/destroy' => 'events#destroy'

  post 'events/create' => 'events#create'

  post 'events/update' => 'events#update'

  post 'events/unjoin' => 'events#unjoin'

  post 'events/join' => 'events#join'

  post 'comments/destroy' => 'comments#destroy'

  post 'comments/create' => 'comments#create'

  post '/login' => 'sessions#create'

  post '/sessions/:id' => 'sessions#destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
