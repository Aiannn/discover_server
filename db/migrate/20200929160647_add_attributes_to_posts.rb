class AddAttributesToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :description, :string
    add_column :posts, :hashtag, :string
  end
end
