module Admin
 class FishingProgramsController < ApplicationController

  def index
    @fishing_programs = FishingProgram.all
  end

  def show
    @fishing_program = FishingProgram.find(params[:id])
  end

  def new
    @fishing_program = FishingProgram.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @fishing_program }
    end
  end

  def edit
    @fishing_program = FishingProgram.find(params[:id])
  end

  def create
    @fishing_program = FishingProgram.new(params[:fishing_program])

    respond_to do |format|
      if @fishing_program.save
        flash[:notice] = 'Fishing Program was successfully created.'
        format.html { redirect_to([:admin, @fishing_program ]) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @fishing_program = FishingProgram.find(params[:id])

    respond_to do |format|
      if @fishing_program.update_attributes(params[:fishing_program])
        flash[:notice] = 'FishingProgram was successfully updated.'
        format.html { redirect_to([:admin, @fishing_program ]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @fishing_program.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @fishing_program = FishingProgram.find(params[:id])
    @fishing_program.destroy

    respond_to do |format|
      format.html { redirect_to( admin_fishing_programs_path ) }
      format.xml  { head :ok }
    end
  end

 end
end