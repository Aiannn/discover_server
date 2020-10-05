class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :name, :date_of_birth, :bio, :email, :avatar, :followers, :followees, :total_likes

  has_many :posts
  has_many :likes
  has_many :liked_posts, through: :likes, source: :post 

  def avatar 
    rails_blob_path(object.avatar, disposition: 'attachment', only_path: true) if object.avatar.attached?
  end 
end
