module Admin
class FishingSubprogramController < ApplicationController
  def show
    @sp = SubFishingProgram.find( params[:id] )
  end
end
end