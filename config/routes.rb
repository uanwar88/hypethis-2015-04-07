Rails.application.routes.draw do
  root "cities#index"

  scope path: "/users", controller: :users do
    get "/" => :index, as: "users"
    get "/new" => :new, as: "new_user"
    post "/" => :create, as: "create_user"
  end

  scope path: "/:username", controller: :users do
    get "/" => :show, as: "user"
    get "/edit" => :edit, as: "edit_user"
    patch "/edit" => :update, as: "patch_user"
    delete "/" => :destroy, as: "delete_user"
    get "/starred" => :starred, as: "user_starred"
  end

  scope path: "/users", controller: :sessions do
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    get "/logout" => "sessions#destroy"
  end

  scope path: "/:city", controller: :cities do
    get "/" => :show, as: "city"
    get "/:year" => :year
    get "/:year/:month" => :month
    get "/:year/:month/:day" => :day
    get "/:year/top" => :topyear
    get "/:year/:month/top" => :topmonth
    get "/:year/week/:week" => :week
  end

  get ":city/events/new" => "events#new", as: "new_event"

  scope path: "/events", controller: :events do
    post "/" => :create
    get "/:id" => :show, as: "event"
    get "/:id/edit" => :edit, as: "edit_event"
    post "/:id" => :update
    delete "/:id" => :destroy, as: "delete_event"
  end

  scope path: ":city/categories", controller: :categories do
    get "/:name" => "categories#show"
  end

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
