class SavedVideosController < ApplicationController
  before_action :authenticate_user!

  def index
    @saved_videos = current_user.saved_videos
      .left_joins(:video_folders)
      .where(video_folders: { id: nil })

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
    @saved_video = current_user.saved_videos.find_by(url: saved_video_params[:url])

    if @saved_video && @saved_video.video_folders.count == 1 &&
      @saved_video.video_folders.first.folder_id.nil?

      @saved_video.destroy
      redirect_back fallback_location: searches_path, notice: "保存を解除しました"
      return
    end

    @saved_video ||= current_user.saved_videos.create!(saved_video_params)

    @saved_video.video_folders.find_or_create_by(folder_id: nil)

    redirect_back fallback_location: searches_path, notice: "動画を保存しました"
  end



  def destroy
    @saved_video = current_user.saved_videos.find(params[:id])
    @saved_video.destroy
    redirect_back fallback_location: searches_path, notice: "保存を解除しました"
  end


  private

  def saved_video_params
    params.require(:saved_video).permit(:title, :url, :nickname, :username)
  end
end
