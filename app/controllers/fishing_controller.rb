class FishingController < ApplicationController
    def title
        return "Fishing - " + FishingProgram.find(params[:id]).title if (params && params[:id])
        return "Fishing"
    end

    def index
        @fishing_programs = FishingProgram.all (:conditions => {:hidden => false})
    end
    def show
        @fishing_program = FishingProgram.find(params[:id])
    end
end
