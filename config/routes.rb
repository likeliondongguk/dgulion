Rails.application.routes.draw do
  devise_for :users, controllers: {
      :registrations => "user/registrations",
      :sessions => "user/sessions" }
  root "home#index"
  get 'home/header'
  get 'home/index'
  get 'home/photo_gallery'

  get 'boards/index'
  post 'boards/index'
  get 'boards/header'
  resources :boards
  # nojong
  resources :blogs do
    resources :comments, module: :blog, only: [:create, :destroy]
  end

  resources :questions do
    resources :comments, module: :question, only: [:create, :destroy]
    resources :answers, only: [:create, :destroy]
  end
  get '/answers/select/:id' => 'answers#select'
  get '/questions/asktags/:tag_id' => 'tags#search'
  post '/imageUpload' => 'summerimage#imageUpload'
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
