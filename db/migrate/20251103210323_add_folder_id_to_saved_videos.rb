class AddFolderIdToSavedVideos < ActiveRecord::Migration[8.0]
  def change
    add_reference :saved_videos, :folder, null: false, foreign_key: true
  end
end
