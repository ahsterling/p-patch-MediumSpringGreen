class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @users = User.all
    @post = Post.create(post_params)

    if @post.save

      @users.each do |u|
        user_id = u.id
        post_id = @post.id
        Resque.enqueue(EmailJob, user_id, post_id)
      end

      redirect_to posts_path
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :user_id)

  end
end
