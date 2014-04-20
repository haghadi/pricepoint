 Bandblitz::Application.routes.draw do


  resources :prices
  resources :products_stores
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :stores
  resources :products
  

  match '/prices', :to => 'prices#index'
  match '/pricess', :to => 'prices#smartphones'
  match '/pricec', :to => 'prices#consoles'
  match '/pricel', :to => 'prices#lcds'
 


  match '/newprice', :to => "prices#new"
  
  match '/signup', :to => 'users#new'
  match '/login',  to: 'sessions#new'
  match '/logout', to: 'sessions#destroy', via: :delete
  match '/users', to: 'users#index'

  match '/stores', to: 'stores#index'
  match '/newstore', to: 'stores#new'

  match '/products', to: 'products#pro' 

  match '/smartphones', to: 'products#smartphones'
  match '/lcds', to: 'products#lcds'
  match '/cameras', to: 'products#cameras'
  match '/consoles', to: 'products#consoles'

  match '/newproduct', to: 'products#new'


  root :to => 'static_pages#home'

  match '/home', :to => 'static_pages#home'

  match '/about', :to => 'static_pages#about'
  match '/contact', :to => 'static_pages#contact'
  match '/advertise', :to => 'static_pages#advertise'
  match '/privacy', :to => 'static_pages#privacy'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
