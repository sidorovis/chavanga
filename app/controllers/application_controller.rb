# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

# google api key: 127.0.0.1: 'ABQIAAAAshX1rAk9Jx09XvfOOnHuVBRi_j0U6kJrkFvY4-OX2XYmEAa76BTG-4LiqhKF9GnvE0AzrNjmJcLp_g'
# google api key: chavanga.heroku.com: 'ABQIAAAAshX1rAk9Jx09XvfOOnHuVBQMTomGlBTa1OkUsqCzpm816lUX3xRvBtPiXkn3hacxzl4krqAa9fr7KA'

#require 'rubygems'
#require 'google_geocode'

class ApplicationController < ActionController::Base
    helper :all # include all helpers, all the time
    protect_from_forgery # See ActionController::RequestForgeryProtection for details

    before_filter :load_events, :load_partner_links, :load_additional_links, :load_google_map, :load_fishing_programs, :load_gallery_groups, :load_image_gallery_flies, :load_image_gallery_the_best, :load_banners

    def title
        controller_name.capitalize.split("_").join(" ")
    end
    def description
        "Fishing at chavanga river stays in your heart forever. Chavanga fly fishing information. Chavanga, Varzuga, Kitsa, Indiora, Pulonga, Pialitsa, Chapoma, Kamchatka, Habarovsk region fishing, North Kola fishing, Greenland fishing program."
    end
    def keywords
        "fishing, fishes, fish, chavanga fishing, chavanga, flies, Murmansk, Varguza, Kitsa, Indiora, Kamchatka, Bystraya, Opala, Zypanova, Zhurovaya, Bolshaya, Pulonga, Pialitsa, Chapoma, Habarovsk region, Bichy, Tugur, Ketanda, Urak, Uda "
    end
    def load_events
        @left_column_events = Event.all :limit => 5, :conditions => { :published => true }, :order => 'created_at DESC'
    end

    def load_partner_links
        @left_column_partner_links = PartnerLink.all( :conditions => { :visible => true } )
    end
  
    def load_additional_links
        @left_column_additional_links = AdditionalLink.all( :conditions => { :published => true } )
    end

    def load_google_map
#        @application_key = YAML.load_file(RAILS_ROOT + '/config/gmaps_api_key.yml')[ENV['RAILS_ENV']]
#        if (ENV['RAILS_ENV'] == "production")
#            @application_key = @application_key["chavanga.heroku.com"]
#        end
#    @map = GMap.new("chavanga_map")
#    @map.set_map_type_init(GMapType::G_SATELLITE_MAP)
#    @map.control_init(:smapp_map => true, :map_type => true, :owerview_map => false)
#    @map.center_zoom_init([66.126005,37.747779], 13)
    end

    def load_fishing_programs
        @menu_fishing_programs = FishingProgram.all(:conditions => { :hidden => false } )
    end
  
    def load_gallery_groups
        @gallery_group = ImageGalleryGroup.first( :conditions => [ "parent_group_id = id" ])
    end


    def load_image_gallery_flies
        @right_menu_flies_count = 5
    
        @flies_all = ImageGalleryGroup.first( :conditions => { "id" => 55 } )
        all_images, d = @flies_all.get_images(0,1000)

        @selected_ids = {}
        
        while ( @selected_ids.size < @right_menu_flies_count )
            image_id = (rand()*all_images.size).to_i
            @selected_ids[ image_id ] = all_images[ image_id ]
        end
    end
    
    def load_image_gallery_the_best
        @the_best_image_gallery = ImageGalleryGroup.first( :conditions => { "id" => 59 } )
    end
    
    def load_banners
        @all_banners = Banner.all
    	end
  
    def go_home
        redirect_to( :controller => :home )
    end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
