module FishingHelper
    def fishing_program_path( fp )
        '/fishing/'+fp.id.to_s
    end
    def fishing_program_on_click( image_name )
        'change_fishing_program_image(this, '+image_name+');'
    end
end
