Rails.application.routes.draw do
  #Users Routes
  root 'users#login'
  get '/login', to: 'users#login', as: "login"
  get '/profile/:id', to: 'users#profile', as: "profile" #Home_page = where swiping will occur (id used to populate queue)
  get '/profile/:id/snippet', to: 'users#snippet', as: "snippet" #sample profile page of user to be displayed in carousel 
  get '/profile/:id/edit', to: 'users#edit', as: "edit_profile"
  get '/auth/:provider/callback', to: 'users#create', as: "create" #fb oauth
  get '/auth/:provider/callback', to: 'users#create_fb', as: "create_fb" #fb oauth
  put '/profile/:id/edit', to: 'users#update', as: "update"
  delete '/logout', to: 'users#logout', as: "logout"

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
