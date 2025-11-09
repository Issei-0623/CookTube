class ChangeFolderIdNullableInSavedVideos < ActiveRecord::Migration[8.0]
  def change
    change_column_null :saved_videos, :folder_id, true
  end
end
