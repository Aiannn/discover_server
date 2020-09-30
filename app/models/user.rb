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
        posts = []
        self.followees.map do |followee|
            posts << followee.posts 
        end 
        concatenated = posts.flatten
        concatenated
    end

    def total_likes
        likes = 0 
        self.posts.each do |post|
            likes = likes + post.likes.length
        end 
        likes 
    end

    def likes_per_post
        likes_per_post = (self.total_likes).to_f / self.posts.length 
        likes_per_post
    end
end
