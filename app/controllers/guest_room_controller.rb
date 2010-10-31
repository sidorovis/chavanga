class GuestRoomController < ApplicationController
  def index
    @new_post = Post.new
    @posts = Post.all( :conditions => { :published => true }, :order => "id DESC" )
    
  end
  def create
    @post = Post.new( params[:post] )
    @post.published = true
    respond_to do |format|
      if !@post.body["http"] && @post.body == ERB::Util::h(@post.body) && @post.save
        flash[:notice] = 'Post was successfully created.'
      end
      format.html { redirect_to(:controller => :guest_room) }
    end
    
  end

end
