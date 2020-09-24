class FollowsController < ApplicationController

    def create 
        @user_follower = User.find_by(id: params[:follower_id]) #current_user
        @user_following = User.find_by(id: params[:following_id]) #user
        @user_follower.followees << @user_following 
        render json: {status: 'Done'}
    end

    def unfollow
        @user_follower = User.find_by(id: params[:follower_id])
        @user_following = User.find_by(id: params[:following_id])
        @user_follower.followed_users.find_by(followee_id: @user_following.id).destroy 
        render json: {status: 'Done'}
    end

end
