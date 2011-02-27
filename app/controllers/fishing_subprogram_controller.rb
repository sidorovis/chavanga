class FishingSubprogramController < ApplicationController
    def title
        return "Fishing - " + SubFishingProgram.find(params[:id]).title if (params && params[:id])
        return "Fishing"
    end

    def show
        @sp = SubFishingProgram.find( params[:id] )
    end
end
