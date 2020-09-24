class LikesController < ApplicationController

    def create 
        @user = User.find_by(username: params[:user])
        @post = Post.find_by(id: params[:post][:id])
        @like = Like.create(user_id: @user.id, post_id: @post.id)
        render json: @like 
    end

    def destroy
        Like.destroy(params[:id])
    end

    def index
        @user = current_user
        @posts = @user.liked_posts
        render json: @posts
    end
end
