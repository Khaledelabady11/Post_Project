class CommentsController < ApplicationController

  # def index
  #   @comments=Comment.all
  #   render json: @comments
  # end

  def create
    @post = Post.find(params[:post_id])
    @comment = @article.comments.create(comment_params)
    redirect_to post_path(@post)
    render json: @comment, status: :created

  end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end

end
