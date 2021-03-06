ClickAndBuy::Application.routes.draw do

  resources :menus
  post   '/menus/sort'  => "menus#sort",  as: :menu_sort

  resources :partners
  resources :shops
  resources :items

  #devise_for :users
  devise_for :users, :controllers => {
    omniauth_callbacks: "users/omniauth_callbacks",
    registrations:      "registrations"
  }

  get    '/users'           => "users#index"

  get    '/history'         => "items#history"

  get    '/vote/:id/:like'  => "users#vote",   as: :user_vote
  get    '/user/:id'        => "users#show",   as: :user_info
  post   '/user/:id/admin'  => "users#admin",  as: :user_make_admin
  post   '/user/:id/ban'    => "users#ban",    as: :user_ban
  delete '/user/:id/delete' => "users#delete", as: :user_delete
  get    '/user/:id/own'    => "users#owned" , as: :user_owned
  post   '/user/:id/own'    => "users#own"   , as: :user_own

  # генерирем код для товара
  get   '/code/:id'              => "code#generate" , as: :code_get
  get   '/download/:id/code.pdf' => "code#download" , as: :code_download


  #get  '/item' => "static_pages#item"
  
  get  '/shops/:id/items'      => "shops#items",    as: :shop_items
  post '/shops/:id/items'      => "shops#add_item", as: :shop_add_item
  get  '/shops/:id/:item/stat' => "shops#stat",     as: :shop_stat
  get  '/shops/:id/search'     => "shops#search",   as: :shop_search
  get  '/shops/:id/codes'      => "shops#codes",    as: :shop_codes
  get  '/shops/:id/users'      => "shops#users",    as: :shop_users
  get  '/shops/:id/history'    => "shops#history",  as: :shop_history
  post '/shop/:id/ban'         => "shops#ban",      as: :shop_ban
  get  '/shop/:id/support'     => "shops#support",  as: :shop_support

  get  '/tagged'         => 'items#tagged',      as: :tagged
  post '/items/:id/like' => "items#like",        as: :like
  post '/like/:id'       => "items#like_delete", as: :like_delete
  


  get  '/categories'       => "menus#index",     as: :category
  get  '/category/:tag'    => "items#tagged",    as: :category_search

  get '/search'            => "static_pages#search",   as: :search

  #get '/autocomplete_user_last_name' => "users#autocomplete_user_last_name", as: :autocomplete_user_last_name
  get "*path", to: "error#error_404"
  root "static_pages#index"
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
