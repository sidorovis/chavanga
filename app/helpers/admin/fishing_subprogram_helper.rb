
module Admin::FishingSubprogramHelper
    def admin_sub_fishing_program_path( sp )
        '/admin/fishing_information/'+sp.id.to_s
    end
end
