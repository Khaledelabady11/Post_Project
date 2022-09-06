class Api::V1::PostsController < ApplicationController
  CACHE_KEY = 'POSTS_CACHED'
  after_action :cache_response, only: [:index]
  before_action :check_cache, only: [:index]

  def index
    @posts ||= Post.all

    render json: @posts
  end

  def create
    @post = Post.create post_params

    if @post.valid?
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    render status: :no_content
  end

  private

  def cache_response
    REDIS_CLIENT.set CACHE_KEY, response.body
  end

  def check_cache
    @posts = REDIS_CLIENT.get(CACHE_KEY)
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
