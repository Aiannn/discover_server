class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :username, :name, :date_of_birth, :bio, :email, :avatar

  def avatar 
    rails_blob_path(object.avatar, disposition: 'attachment', only_path: true) if object.avatar.attached?
  end 
end
