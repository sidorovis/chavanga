Chavanga::Application.routes.draw do

    namespace :admin do
        root :to => "home#index"
        match 'team' => 'team#index'
        resources :fishing_programs
        resources :sub_fishing_programs
        resources :image_gallery_images
        
        resources :image_gallery_groups do
            resources :image_gallery_images
        end
        resources :partner_links
        resources :events
        match 'press(/:action)' => 'press#index'
        match 'booking' => 'booking#index'
        match 'contact' => 'contact#index'
        match 'guest_room' => 'guest_room#index'
        match 'guest_room/destroy' => 'guest_room#destroy'
        match 'guest_room/create_comment', :controller => 'guest_room', :action => 'create_comment'
        match 'guest_room/destroy_comment', :controller => 'guest_room', :action => 'destroy_comment'
        match 'guest_room/load_form', :controller => 'guest_room', :action => 'load_form'
        resources :color
        resources :text_effects
        resources :banners
        match 'maps(/:action)' => 'maps#index'
        match 'maps' => 'maps#index'
    end

=begin
    map.namespace :admin do |admin|
        admin.root      :controller => "home"
 #       admin.resources :articles
        admin.resources :image_gallery_images
        admin.resources :image_gallery_groups, :has_many => [ :image_gallery_images ]
        admin.resources :partner_links
#        admin.resources :guest_room
#        admin.connect 'guest_room/destroy_comment', :controller => 'guest_room', :action => 'destroy_comment'
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
=end

  match 'home' => 'home#index'
  match 'home/load_news_from_blog'

  match 'team' => 'team#index'
  match 'fishing' => 'fishing#index'
  match 'fishing/:id' => 'fishing#show'
  match 'fishing_information/:id' => 'fishing_subprogram#show'
  match 'image_gallery_groups(/:id)' => 'image_gallery_groups#show'
  match 'press(/:action)' => 'press#index'
  match 'maps(/:action)' => 'maps#index'
  match 'maps' => 'maps#index'
  match 'events/:id' => 'events#show'
  match 'booking' => 'booking#index'
  match 'contact' => 'contact#index'
  
  resources :guest_room do
    resource :posts
    collection do
        get :long
      end
      member do
        post :short
      end
  end
  match 'contact' => 'contact#index'

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
  root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
#  match ':controller(/:action(/:id(.:format)))'
end
