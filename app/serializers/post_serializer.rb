class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :title, :image, :track, :likes, :user, :created_at, :updated_at

  belongs_to :user
  has_many :likes 

  def image
    rails_blob_path(object.image, disposition: 'attachment', only_path: true) if object.image.attached?
  end

  def track 
    rails_blob_path(object.track, disposition: 'attachment', only_path: true) if object.track.attached?
  end
end
