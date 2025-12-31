class AddNeedsSortingToSavedVideos < ActiveRecord::Migration[8.0]
  def change
    add_column :saved_videos, :needs_sorting, :boolean
  end
end
