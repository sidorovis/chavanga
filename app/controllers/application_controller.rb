# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

# google api key: 127.0.0.1: 'ABQIAAAAshX1rAk9Jx09XvfOOnHuVBRi_j0U6kJrkFvY4-OX2XYmEAa76BTG-4LiqhKF9GnvE0AzrNjmJcLp_g'
# google api key: chavanga.heroku.com: 'ABQIAAAAshX1rAk9Jx09XvfOOnHuVBQMTomGlBTa1OkUsqCzpm816lUX3xRvBtPiXkn3hacxzl4krqAa9fr7KA'

require 'rubygems'
require 'google_geocode'

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :load_events, :load_partner_links, :load_google_map
  
  def load_events
    @left_column_events = Event.all :limit => 5, :conditions => { :published => true }
  end

  def load_partner_links
    @left_column_partner_links = PartnerLink.all( :conditions => { :visible => true } )
  end
  
  def load_google_map
    @application_key = "ABQIAAAAshX1rAk9Jx09XvfOOnHuVBRi_j0U6kJrkFvY4-OX2XYmEAa76BTG-4LiqhKF9GnvE0AzrNjmJcLp_g"
    @map = GMap.new("map_div")
    @map.control_init(:small_map => true,:map_type => true)
    @map.center_zoom_init([75.5,-42.56],4)
#    @map.overlay_init(GMarker.new([75.6,-42.467],:title => "Chavanga Map", :info_window => "See Chavanga Map"))
  end

  def go_home
    redirect_to( :controller => :home )
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
