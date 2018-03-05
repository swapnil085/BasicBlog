class CommentsController < ApplicationController
  before_action :correct_user, only: :destroy

    def create
       @post = Post.find(params[:post_id])
       @comment = @post.comments.create(comment_params)
       @comment.user_id = current_user.id
       @comment.save

       redirect_to post_path(@post)
    end


    def destroy
      @post = Post.find(params[:post_id])
      @comment = @post.comments.find(params[:id])
      @comment.destroy

      redirect_to post_path(@post)
    end

    private

    def comment_params
      params.require(:comment).permit(:name, :body)
    end

    def correct_user
    @comment = current_user.comments.find_by(id: params[:id])
      if @comment.nil?
        flash[:alert] = "Not your comment!"
        redirect_back fallback_location: root_path
      end
    end


end
