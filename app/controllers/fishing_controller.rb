class FishingController < ApplicationController
  def index
    @fishing_programs = FishingProgram.all (:conditions => {:hidden => nil})
  end
  def show
    @fishing_program = FishingProgram.find(params[:id])
  end
end
