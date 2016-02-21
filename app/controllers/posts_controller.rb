class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def create 
  	@post = Post.new(post_params)
  	if @post.save
  		redirect_to post_path(@post.id)
  	else
  		flash[:danger] = "Error in creating Post"
  		redirect_to posts_path
  	end
  end

  def index
  	@posts = Post.last(5).reverse
  end

  def edit
    @post = Post.find(params[:id])
    if user_permission?(@post.user.id)
      render 'edit'
    else
      head:forbidden
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      flash[:danger] = "Error Updating"
      redirect_to edit_post_path(@post.id)
    end
  end

  def show
  	@post = Post.find(params[:id])
    @pst_created_at = (@post.created_at - 8.hours).to_datetime
    @pst_updated_at = (@post.updated_at - 8.hours).to_datetime
  end

  def destroy
    @post = Post.find(params[:id])
    if user_permission?(@post.user.id)
      @post.destroy
      redirect_to root_path
    else
      head:forbidden
    end
  end
  private 
  	def post_params
  		params.require(:post).permit(:title,:body,:user_id,:subject)
  	end

    def user_permission?(id)
       if @current_user && @current_user.id == id
        return true
      else
        return false
      end
    end
end
