class SearchesController < ApplicationController
  def index
    if params[:keyword].present?
      @tiktok_url = "https://www.tiktok.com/search?q=#{params[:keyword]}"
    end

    @videos = [
      { title: "オムライスの作り方", url: "/videos/test_video1.mp4" },
      { title: "親子丼のレシピ", url: "/videos/test_video2.mp4" },
      { title: "カツ丼の作り方", url: "/videos/test_video3.mp4" }
    ]
  end
end