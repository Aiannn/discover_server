class Post < ApplicationRecord
    has_one_attached :image
    has_one_attached :track

    belongs_to :user
    has_many :likes, dependent: :destroy 
    
    def self.most_liked
        Post.all.sort_by{|post| -post.likes.length} #.take(6)
    end

end
