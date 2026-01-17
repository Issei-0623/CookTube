class SearchesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'open-uri'


  def index
    return unless params[:keyword].present?

    page = (params[:page] || 1).to_i
    per_page = 12

    url = URI("https://www.googleapis.com/youtube/v3/search")

    query = {
      part: "snippet",
      q: "#{params[:keyword]} #shorts",
      type: "video",
      videoDuration: "short",
      maxResults: per_page,
      key: ENV["YOUTUBE_API_KEY"]
    }

    url.query = URI.encode_www_form(query)

    response = Net::HTTP.get(url)
    result = JSON.parse(response)

    @videos = result["items"] || []
  end

end

