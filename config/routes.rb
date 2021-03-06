Rails.application.routes.draw do
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
  root 'application#angular'

  namespace :api do 
    match 'programs/create', to: 'programs#create', via: [:post]
    match 'programs/update', to: 'programs#update', via: [:post]
    get 'programs/search/:q', to: 'programs#search'
    get 'programs/category/:c', to: 'programs#get_by_category'
    get 'programs/:id', to: 'programs#get'    

    get 'providers/all', to: 'providers#get_all'
    get 'providers/:id', to: 'providers#get'
    match 'providers/update', to: 'providers#update', via: [:post]
    match 'providers/create', to: 'providers#create', via: [:post]

    get 'sessions/program/:program_id', to: 'sessions#get_by_program'
    get 'sessions/:id', to: 'sessions#get'
    match 'sessions/update', to: 'sessions#update', via: [:post]
    match 'sessions/create', to: 'sessions#create', via: [:post]    

    get 'authentication', to: 'authentications#authenticate'
    match 'signup', to: 'authentications#signup', via: [:post]    
  end

  match '/*any_path_except_API', to: 'application#angular', via: :all
end
