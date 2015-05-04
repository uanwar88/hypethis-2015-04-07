Rails.application.routes.draw do
  root "cities#index"

  scope path: "/users", controller: :users do
    get "/" => :index, as: "users"
    get "/new" => :new, as: "new_user"
    post "/" => :create, as: "create_user"
  end

  scope path: "/users/:username", controller: :users do
    get "/" => :show, as: "user"
    get "/edit" => :edit, as: "edit_user"
    patch "/edit" => :update, as: "patch_user"
    delete "/" => :destroy, as: "delete_user"
    get "/starred" => :starred, as: "user_starred"
  end

  scope path: "/users", controller: :sessions do
    get "/login" => "sessions#new", as: "login"
    post "/login" => "sessions#create"
    get "/logout" => "sessions#destroy", as: "logout"
  end

  scope path: "/:city/categories", controller: :categories do
    get "/:category_id/:year/top" => :topyear
    get "/:category_id/:year/:month/top" => :topmonth
    get "/:category_id/:year/week/:week" => :week
    get "/:category_id" => :show
    get "/:category_id/:year" => :year
    get "/:category_id/:year/:month" => :month
    get "/:category_id/:year/:month/:day" => :day
  end

  scope path: "/:city", controller: :cities do
    get "/:year/top" => :topyear
    get "/:year/:month/top" => :topmonth
    get "/:year/week/:week" => :week
    get "/" => :show, as: "city"
    get "/:year" => :year
    get "/:year/:month" => :month
    get "/:year/:month/:day" => :day
  end

  get ":city/events/new" => "events#new", as: "new_event"

  scope path: "/events", controller: :events do
    get "/new" => :new, as: "new_event"
    post "/" => :create
    get "/:id" => :show, as: "event"
    get "/:id/edit" => :edit, as: "edit_event"
    post "/:id" => :update
    delete "/:id" => :destroy, as: "delete_event"
  end
end
