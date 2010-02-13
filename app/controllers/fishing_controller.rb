class FishingController < ApplicationController
  def index
    @fishing_programs = FishingProgram.all
  end

end
