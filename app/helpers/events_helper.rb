module EventsHelper
    def event_path( event )
        '/events/'+event.id.to_s
    end
end
