class SearchesController < ApplicationController
  def index
  if params[:keyword].present?
    @tiktok_url = "https://www.tiktok.com/search?q=#{params[:keyword]}"
  end
end
end
