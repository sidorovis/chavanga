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
  def create_comment
    @post = Post.find( params[:comment][:post_id].to_i )
    @comment = @post.comments.new( params[:post_comment] )
    if @comment.save
        flash[:notice] = 'Comment was successfully created.'
    else
        flash[:error] = 'Comment was not created.'
    end
    redirect_to( :controller => :guest_room )
  end
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to( :controller => :guest_room ) }
      format.xml  { head :ok }
    end
  end
  def destroy_comment
    @comment = PostComment.find( params[:id] )
    @comment.destroy
    redirect_to( :controller => :guest_room )
  end
  def load_form
    @post = Post.find(params[:id])
    @new_comment = @post.comments.new
    render :update do |page|
        page.replace_html params[:update], :partial => 'new_comment_form'
    end
    
  end

 end
end