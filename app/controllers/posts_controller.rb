class PostsController < ApplicationController

    def index 
        @posts = Post.all
        render json: @posts.order('created_at DESC')
    end

    def most_liked
        @posts = Post.most_liked
        render json: @posts 
    end

    def feeds
        @followees = current_user.followees
        # @followees = User.first.followees
        @feeds = @followees.map do |followee|
            followee.posts.map do |post|
                PostSerializer.new(post)
            end 
        end 
        # render json: {posts: @feeds}
        render json: {posts: @feeds }
    end

    def create
        @user = User.find_by(username: params[:user])
        @post = Post.create(title: params[:title], user_id: @user.id)
        @post.image.attach(params[:image])
        @post.track.attach(params[:track])
        render json: @post 
    end


    def show
        @post = Post.find_by(id: params[:id])
        render json: {post: PostSerializer.new(@post)}
    end 

    def destroy
        Post.destroy(params[:id])
    end
end
