class PostsController < ApplicationController

    def index 
        @posts = Post.all
        render json: @posts.with_attached_image
    end

    def show
        @post = Post.find_by(id: params[:id])
        render json: {post: PostSerializer.new(@post), image: url_for(@post.image)}
    end 
end
