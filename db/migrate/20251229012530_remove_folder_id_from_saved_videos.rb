class RemoveFolderIdFromSavedVideos < ActiveRecord::Migration[8.0]
  def change
    remove_column :saved_videos, :folder_id, :integer
  end
end
