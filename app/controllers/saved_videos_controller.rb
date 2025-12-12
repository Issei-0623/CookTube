class SavedVideosController < ApplicationController
  before_action :authenticate_user!

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
    @saved_video = current_user.saved_videos.new(saved_video_params)
    if @saved_video.save
      redirect_back fallback_location: searches_path, notice: "動画を保存しました！"
    else
      redirect_back fallback_location: searches_path, alert: "保存に失敗しました"
    end
  end

  def destroy
    @saved_video = current_user.saved_videos.find(params[:id])
    @saved_video.destroy
    redirect_to saved_videos_path, notice: "動画を削除しました！"
  end

  private

  def saved_video_params
    params.require(:saved_video).permit(:title, :url, :nickname, :username)
  end
end
