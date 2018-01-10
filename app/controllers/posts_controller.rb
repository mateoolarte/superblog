class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :find_post, only: [:show, :edit, :update]

  def index
    @posts = Post.order("created_at DESC")
  end
  
  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "El post ha sido creado con éxito"
    else
      render :new
    end  
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path, notice: "El post ha sido modificado con éxito"
    else
      render :edit
    end    
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy

    redirect_to posts_path, notice: "El post fue eliminado con éxito"
  end

  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
