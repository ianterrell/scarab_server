ActionController::Routing::Routes.draw do |map|
  ###
  # Basics
  map.root :controller => 'main'
  map.about "/about", :controller => 'main', :action => "who"
  map.dashboard '/dashboard', :controller => 'dashboard'

  ###
  # Sign up, sign in, sign out
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.register '/register', :controller => 'users', :action => 'create'
  map.signup '/signup', :controller => 'users', :action => 'new'
  map.activate '/activate/:activation_code', :controller => 'users', :action => 'activate'
  map.forgot '/forgot', :controller => 'users', :action => 'forgot'
  map.reset '/reset/:reset_code', :controller => 'users', :action => 'reset'
  map.resources :users
  map.resource :session
  
  ###
  # Issues
  map.issue '/issues/:number', :controller => "issues", :action => "show"
  
  ###
  # Mailing List
  map.mailing_list "/mailinglist", :controller => 'mailing_list_recipients', :action => 'new'
  map.resources :mailing_list_recipients, :only => :create
  
  ###
  # Content Management
  map.namespace :admin do |admin|
    admin.root :controller => "admin", :action => "dashboard"
    
    admin.resources :issues, :member => { :sort => :post, :publish => [:get, :post] }
    admin.resources :works, :collection => { :create_from_submission => :post }, :member => { :audio => :get }
    admin.resources :authors, :collection => { :create_from_user => :post }
    
    admin.resources :updates, :member => { :publish => [:get, :post] }
    
    admin.resources :interviews, :member => { :publish => [:get, :post] } do |interviews|
      interviews.resources :footnotes  
    end
    
    admin.resources :categories
    admin.resources :questions
    
    admin.resources :notifications, :only => [:index, :new, :create]
    
    admin.namespace :reports do |reports|
      reports.resources :quarters, :member => { :generate_royalty_payments => :post } do |quarters|
        quarters.resources :apple_payments
        quarters.resources :royalty_payments
      end
      reports.resources :apple_payments do |apple_payments|
        apple_payments.resources :issue_payment_portions
      end
      reports.resources :issues do |issues|
        issues.resources :issue_payment_portions
      end
      reports.resources :authors do |authors|
        authors.resources :royalty_payments
      end
      reports.resources :royalty_payments, :member => { :mark_paid => :post }
    end
    
    admin.resources :submissions, :except => [:destroy], :collection => { :unassigned => :get },
      :member => { 
        :reject_discourage => :post, 
        :reject_neutral => :post, 
        :reject_encourage => :post, 
        :promote => :post, 
        :reject => :post, 
        :accept => :post 
      }
      
    admin.cache_control "cache", :controller => "cache"  
    admin.cache_expire "cache_expire", :controller => "cache", :action => "expire"
  end
  
  # TODO: limit routes to only those implemented?
  
  ###
  # API for iPhone
  map.namespace :api do |api|
    api.namespace :v1 do |v1|
      v1.issues_since "issues/since/:number.:format", :controller => "issues", :action => "published_since_number"
      v1.resources :issues do |issues|
        issues.resources :works
        issues.resources :authors
      end
      v1.resources :works, :member => { :audio => :get }
      v1.resources :authors
      
      v1.interviews_since "updates/since/:number.:format", :controller => "updates", :action => "published_since_number"

      v1.interviews_since "interviews/since/:number.:format", :controller => "interviews", :action => "published_since_number"
      v1.resources :interviews do |interviews|
        interviews.resources :footnotes  
      end
      
      v1.resource :transactions
      v1.resource :devices, :only => [:create]
      v1.resources :feedbacks
    end
  end
  
  ###
  # Purchasing
  map.resource :transactions
  
  ###
  # FAQ
  map.faq '/faq', :controller => 'faq'
  
  ###
  # Submissions
  map.submit_work "/submit", :controller => "submissions", :action => "new"
  map.resources :submissions, :only => [:new, :create]
  map.resource :bio
  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  # map.connect ':controller/:action/:id'
  # map.connect ':controller/:action/:id.:format'
end
