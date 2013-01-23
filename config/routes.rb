CodeMontage::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :path => 'auth'

  root :to => "home#index"
  
  get '/apply', {:controller => 'home', :action => 'apply'}
  get '/developers_for_good', {:controller => 'home', :action => 'developers_for_good'}
  get '/jobs', {:controller => 'home', :action => 'jobs'}
  get '/join', {:controller => 'home', :action => 'join'}
  get '/our_story', {:controller => 'home', :action => 'our_story'}
  get '/services', {:controller => 'home', :action => 'services'}
  get '/training', {:controller => 'home', :action => 'training'}

  # Preserve links from tumblr placeholder
  match "/post/36213108516/developersforgood-in-2011-programming-related" => redirect("http://blog.codemontage.com/post/36213108516/developersforgood-in-2011-programming-related")
  match "/post/36212820170/future-software-superheroes-its-time-for-your" => redirect("http://blog.codemontage.com/post/36212820170/future-software-superheroes-its-time-for-your")
  match "/post/37410408569/announcing-rolling-admissions" => redirect("http://blog.codemontage.com/post/37410408569/announcing-rolling-admissions")
  match "/post/38111412609/cant-get-a-job-because-i-dont-have-experience" => redirect("http://blog.codemontage.com/post/38111412609/cant-get-a-job-because-i-dont-have-experience")

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
