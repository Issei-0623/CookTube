class FoldersController < ApplicationController
  def index
    @folders = current_user.folders
  end

  def new
    @folder = Folder.new
  end

  def create
  end
end
