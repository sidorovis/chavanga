module Admin
 class GuestRoomController < ApplicationController
  def index
    @new_post = Post.new
    @posts = Post.all( :conditions => { :published => true }, :order => "id DESC" )
    
  end
  def create
    @post = Post.new( params[:post] )
    @post.published = true
    respond_to do |format|
      if @post.save
        flash[:notice] = 'Post was successfully created.'
      end
        format.html { redirect_to(:controller => :guest_room) }
    end
    
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to( :controller => :guest_room ) }
      format.xml  { head :ok }
    end
  end
  def load_form
    @post = Post.find(params[:id])
    @new_comment = @post.comments.new
    render :partial => 'new_comment_form'
  end
    

 end
end