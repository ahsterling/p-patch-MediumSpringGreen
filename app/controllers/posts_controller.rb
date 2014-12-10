class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create

    @post = Post.create(post_params)
    post_id = @post.id
    if @post.save
      Resque.enqueue(EmailJob, post_id)
    end
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)

  end
end
