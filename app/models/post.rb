class Post < ApplicationRecord
    has_one_attached :image
    has_one_attached :track

    belongs_to :user
    has_many :likes 
    
end
