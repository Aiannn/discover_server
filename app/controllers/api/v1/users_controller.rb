class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create, :show]
    def index 
        @users = User.all 
        render json: @users
    end

    def profile
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def show
        # render json: {user: UserSerializer.new(User.first), avatar: url_for(User.first.avatar)}, status: :accepted
        @user = User.find_by(id: params[:id])
        render json: {user: UserSerializer.new(@user)}, status: :accepted
    end

    def create
        if User.find_by(username: params[:user][:username]) == nil
            @user = User.create(username: params[:user][:username], password: params[:user][:password])
            if @user.valid? 
                @token = encode_token(user_id: @user.id)
                render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
            else 
                render json: {error: 'failed to create user'}, status: :not_acceptable
            end     
        else 
            render json: {error: 'User already exists'}
        end 
    end 

    def update
        @user = User.find_by(username: params[:user][:username])
        # @user.update(name: params[:user][:name], date_of_birth: params[:user][:date_of_birth], bio: params[:user][:bio], email: params[:user][:email], avatar: params[:avatar])
        @user.update(avatar: params[:avatar])
        render json: {user: UserSerializer.new(@user)}
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
