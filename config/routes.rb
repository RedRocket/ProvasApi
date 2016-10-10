Rails.application.routes.draw do
  root 'sessions#new'
  resources :sessions, only: [:new, :create]
  resources :cities
  resources :universities
  resources :subjects
  resources :exams
  resources :complaints
  resources :requisitions
  resources :courses
  resources :messages

  get '/edit/' => 'admin#edit'
  patch '/admin' => 'admin#update'
  get '/admin/change_password' => 'admin#change_password'
  patch '/admin/update_password' => 'admin#update_password'


  get '/dashboard' => 'information#dashboard', as: :dashboard
  patch '/user/:id/block' => 'users#block', as: :block_user

  get '/sessions/destroy' => 'sessions#destroy'


  namespace :api do
    get "/admins" => 'admin#show'
    get "/users/:id/exams" => 'users#my_exams'
    get "/users/:id/favorites" => 'users#my_favorites'
    post "/users/sso" => 'users#login_sso'
    post "/users/login" => 'users#login_default'
    post "/users/create" => 'users#create_default'
    post "/users/set_recover_token" => 'users#set_recover_token'
    post "/users/set_new_password" => 'users#set_new_password'
    post "/users/:token/update" => 'users#update'

    patch "/users/logout" => 'users#logout'

    get 'states' => 'states#index'
    get 'states/:id/cities' => "states#cities_in_state"

    get 'cities/:id/universities' => "cities#universities_in_city"
    patch 'cities/:id/add_view' => "cities#add_view"

    get 'universities/:id/courses' => "universities#courses_in_university"
    get 'universities/:id' => "universities#show"
    patch 'universities/:id/add_view' => "universities#add_view"

    get 'courses/:id/subjects' => "courses#subjects_in_courses"

    get 'subjects/:id/exams' => "subjects#exams_in_subjects"
    get 'subjects/:id' => "subjects#show"

    post 'requisitions' => "requisitions#create"

    post 'exams/' => "exams#create"
    post 'exams/images' => "exams#add_image"
    patch 'exams/:id/add_view' => "exams#add_view"

    get 'exams/:id' => "exams#show"
    get 'exams/:id/list' => "exams#list"
    get 'exams/:id/thumbs' => "exams#get_thumb"
    get 'exams/:id/images' => "exams#get_images"

    delete 'exams/:id/images' => "exams#remove_images"
    delete 'exams/:id' => "exams#delete"


    get "favorites/:id" => 'favorites#index'
    post "favorites/" => 'favorites#create'
    delete "favorites/:id" => 'favorites#destroy'
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
