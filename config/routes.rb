Manzanita::Application.routes.draw do
  # map.resources :tags
  resources :tags

  # map.resources :resources
  resources :resources

  #map.resources :subjects do |s|
    #s.resources :prerequisites, :except => [:show, :edit, :update]
    #s.resources :resources, :member => { :upvote => :get, :downvote => :get }
  #end
  resources :subjects do
    resources :prerequisites, :except => [:show, :edit, :update]
    resources :resources do
      member do
        get :upvote 
        get :downvote
      end
    end
  end

  # map.resource :user_session
  resource :user_session

  # map.resources :users
  resources :users

  # map.login "login", :controller => "user_sessions", :action => "new"
  match 'login', :to => 'user_sessions#new', :as => 'login'

  #map.logout "logout", :controller => "user_sessions", :action => "destroy"
  match 'logout', :to => 'user_sessions#destroy', :as => 'logout'

  # map.passwordreset "passwordreset", :controller => "password_resets", :action => "new"
  #map.resources :password_resets, :only => [:new, :create, :edit, :update]
  resources :password_resets, :only => [:new, :create, :edit, :update]

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
  root :to => 'index#index'
  match 'about', :controller => 'content', :action => 'about'
  match 'contact', :controller => 'content', :action => 'contact'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
