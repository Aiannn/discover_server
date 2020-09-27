class User < ApplicationRecord
    has_one_attached :avatar

    has_secure_password
    validates :username, uniqueness: {case_sensitive: false}

    has_many :followed_users, foreign_key: :follower_id, class_name: 'Follow'
    has_many :followees, through: :followed_users

    has_many :following_users, foreign_key: :followee_id, class_name: 'Follow'
    has_many :followers, through: :following_users 

    has_many :posts
    has_many :likes
    has_many :liked_posts, through: :likes, source: :post 

    def feeds
        self.followees.map do |followee|
            followee.posts
        end 
    end

    def total_likes
        likes = 0 
        self.posts.each do |post|
            likes = likes + post.likes.length
        end 
        likes 
    end
end
