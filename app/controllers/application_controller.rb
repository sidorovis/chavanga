# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  before_filter :load_events, :load_partner_links
  
  def load_events
    @left_column_events = Event.all :limit => 5, :conditions => { :published => true }
  end

  def load_partner_links
    @left_column_partner_links = PartnerLink.all( :conditions => { :visible => true } )
  end

  def go_home
    redirect_to( :controller => :home )
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
