class FoldersController < ApplicationController
  def index
    @folders = current_user.folders
    @folder = Folder.new
  end

  def create
    @folder = current_user.folders.build(folder_params)
    if @folder.save
      redirect_to folders_path, notice: "作成しました"
    else
      redirect_to folders_path, alert: "作成に失敗しました"
    end
  end

  private
    def folder_params
      params.require(:folder).permit(:name)
    end
end
