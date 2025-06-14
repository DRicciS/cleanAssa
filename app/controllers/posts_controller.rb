# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy ]
  before_action :authenticate_user!, except: [ :index, :show ]
  load_and_authorize_resource
  # GET /posts
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  # GET /posts/1
  def show
    # @post is set by the before_action
    # We add a new comment object for the form
    @comment = @post.comments.build
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    # For simplicity, we'll assign posts to the first user.
    # In a real app, this would be current_user.
    @post.user = current_user

    if @post.save
      redirect_to @post, notice: "Post was successfully created."
    else
      # Re-render the new view if validation fails to show errors
      render :new, status: :unprocessable_entity
    end
  end

  # GET /posts/1/edit
  def edit
    # @post is set by the before_action
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      # Re-render the edit view if validation fails
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    redirect_to posts_url, notice: "Post was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
