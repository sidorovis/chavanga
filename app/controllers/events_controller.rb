class EventsController < ApplicationController

    def title
        return "Event - " + Event.find(params[:id]).title.capitalize if (params && params[ :id ])
    end

    # GET /events
    # GET /events.xml
    before_filter :go_home, :except => [:show]
  
    def show
        @event = Event.find(params[:id])

        respond_to do |format|
            format.html # show.html.erb
            format.xml  { render :xml => @event }
        end
    end
end
