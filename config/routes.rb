ActionController::Routing::Routes.draw do |map|

    map.namespace :admin do |admin|
        admin.root      :controller => "home"
 #       admin.resources :articles
        admin.resources :image_gallery_images
        admin.resources :image_gallery_groups, :has_many => [ :image_gallery_images ]
        admin.resources :partner_links
        admin.resources :fishing_programs
        admin.resources :sub_fishing_programs
        admin.resources :guest_room
        admin.resources :events
        admin.resources :color
        admin.resources :text_effects
        admin.resources :banners
    end

  map.connect 'fishing_information/:id', :controller => 'FishingSubprogram', :action => 'show'

  map.connect 'guest_room', :controller => 'GuestRoom', :action => 'create', :conditions => { :method => :post }
  map.connect 'image_gallery_groups', :controller => 'ImageGalleryGroups', :action => 'index'
  map.connect 'image_gallery_groups/:id', :controller => 'ImageGalleryGroups', :action => 'show'

  map.connect 'events/:id', :controller => 'Events', :action => 'show'

  map.connect 'fishing', :controller => 'fishing', :action => 'index'
  map.connect 'fishing/:id', :controller => 'fishing', :action => 'show'

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
  map.root :controller => "home"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
