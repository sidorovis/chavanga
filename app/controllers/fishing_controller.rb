class FishingController < ApplicationController
  def index
    @fishing_programs = FishingProgram.all
  end
  def show
    @fishing_program = FishingProgram.find(params[:id])
  end
end
