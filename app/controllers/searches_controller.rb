class SearchesController < ApplicationController
  require "net/http"
  require "uri"
  require "json"

  PER_PAGE = 12

  def index
    return unless params[:keyword].present?

    keyword = params[:keyword]
    page    = (params[:page] || 1).to_i

    # 🔴 新しい検索なら token をリセット
    if page == 1
      session[:youtube_next_page_token] ||= {}
      session[:youtube_next_page_token][keyword] = nil
    end

    page_token = session[:youtube_next_page_token][keyword]

    uri = URI("https://www.googleapis.com/youtube/v3/search")
    uri.query = URI.encode_www_form(
      part: "snippet",
      q: keyword,
      type: "video",
      videoDuration: "short",
      maxResults: PER_PAGE,
      pageToken: page_token,
      key: ENV["YOUTUBE_API_KEY"]
    )

    result  = JSON.parse(Net::HTTP.get(uri))
    @videos = result["items"] || []

    # 🔴 次回用 token を保存（これが最重要）
    session[:youtube_next_page_token][keyword] = result["nextPageToken"]

    respond_to do |format|
      format.html
      format.json do
        html = render_to_string(
          partial: "shared/search_video_card",
          collection: @videos,
          as: :video,
          formats: [:html]
        )
        render json: { html: html }
      end
    end
  end
end
