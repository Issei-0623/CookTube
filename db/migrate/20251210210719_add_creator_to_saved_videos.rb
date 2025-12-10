class AddCreatorToSavedVideos < ActiveRecord::Migration[8.0]
  def change
    add_column :saved_videos, :nickname, :string
    add_column :saved_videos, :username, :string
  end
end
