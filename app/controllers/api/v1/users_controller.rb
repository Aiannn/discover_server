class Api::V1::UsersController < ApplicationController
    # skip_before_action :authorized, only: [:create, :show]
    def index #DONE
        @users = User.all 
        render json: @users
    end

    def profile #DONE
        render json: {user: UserSerializer.new(current_user)}, status: :accepted
    end

    def show #DONE
        @user = User.find_by(username: params[:slug]) 
        render json: {user: UserSerializer.new(@user)}, status: :accepted
    end

    def create #DONE 
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

    def update #NEED TO FIGURE OUT HOW TO UPDATE SPECIFIC ATTRIBUTE WITHOUT CHANGING OTHERS
        @user = User.find_by(username: params[:user])
        @user.avatar.purge
        @user.avatar.attach(params[:avatar])
        @user.update(name: params[:name], date_of_birth: params[:date_of_birth], bio: params[:bio], email: params[:email])
        render json: {user: UserSerializer.new(@user)}
    end

    private
    def user_params #I dont need it i guess
        params.require(:user).permit(:name, :date_of_birth, :bio, :email)
    end
end
