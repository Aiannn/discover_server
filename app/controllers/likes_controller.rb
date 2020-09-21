class LikesController < ApplicationController

    def create 
        @user = current_user 
        @post = Post.find_by(id: params[:post][:id])
        @like = Like.create(user_id: @user.id, post_id: @post.id)
        render json: @like 
    end

    def index
        @user = User.second
        @posts = @user.liked_posts
        render json: @posts
    end
end
