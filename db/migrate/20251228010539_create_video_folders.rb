class CreateVideoFolders < ActiveRecord::Migration[8.0]
  def change
    create_table :video_folders do |t|
      t.references :saved_video, null: false, foreign_key: true
      t.references :folder, null: false, foreign_key: true

      t.timestamps
    end
  end
end
