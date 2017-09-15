Rails.application.routes.draw do  
  get 'travelers_trips/new'

  get 'travelers_trips/create'

  get 'travelers_trips/destroy'

  get 'home/index'

  resources :exspenses

  #devise_for :travelers, controllers: { sessions: 'travelers/sessions' }
  devise_for :travelers, controllers:{
      sessions:           "travelers/sessions",
      registrations:      "travelers/registrations",
      omniauth_callbacks: "travelers/omniauth_callbacks"    
    } 


  devise_scope :travelers do
    get '/travelers/create' => 'travelers/registrations#create'
  end

  devise_scope :trips do
    
  end

  #



  resources :trips, only: [:index,:new,:create,:show,:edit,:update]
  post 'trip/add_traveler/:id' => 'trips#add_traveler_to_trip'
  post 'trip/calculate_dues/:id' => 'trips#calculate_dues'
  get  'trip/show_totals' =>  'trips#show_totals'
  resources :travelers

  resources :exspenses, only: [:index,:new,:create,:show,:edit,:update]

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  #You can have the root of your site routed with "root"
  #root 'welcome#index'

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

  root 'home#index'
end
