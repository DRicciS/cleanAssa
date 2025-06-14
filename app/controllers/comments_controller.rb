class CommentsController < ApplicationController
  before_action :set_post
  before_action :authenticate_user!
  load_and_authorize_resource :comment, through: :post

  def create
    # This action is already correct
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      redirect_to @post, notice: "Comment was successfully created."
    else
      render "posts/show", status: :unprocessable_entity
    end
  end

  def destroy
    # The @comment is already loaded and authorized by `load_and_authorize_resource`.
    # The line below is not needed and has been removed.
    # @comment = @post.comments.find(params[:id])

    @comment.destroy
    redirect_to @post, notice: "Comment was successfully destroyed."
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
