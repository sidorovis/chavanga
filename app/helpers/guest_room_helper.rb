module GuestRoomHelper
    def generate_time( t )
        t.hour.to_s+":"+t.min.to_s+" "+t.day.to_s+"."+t.month.to_s+"."+t.year.to_s
    end
end
