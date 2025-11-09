class SavedVideosController < ApplicationController
  def index
    @saved_videos = current_user.saved_videos.where(folder_id: nil)
    @folders = current_user.folders
  end

  def update
    @video = current_user.saved_videos.find(params[:id])
    if @video.update(folder_id: params[:folder_id])
      redirect_to saved_videos_path, notice: "動画を移動しました"
    else
      redirect_to saved_videos_path, alert: "移動に失敗しました"
    end
  end

  def create
  end

  def destroy
  end
end
