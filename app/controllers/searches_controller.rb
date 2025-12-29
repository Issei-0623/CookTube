class SearchesController < ApplicationController
  require 'net/http'
  require 'uri'
  require 'json'
  require 'open-uri'

  def index
    if params[:keyword].present?
      page = (params[:page] || 1).to_i
      limit = 11
      cursor = (page - 1) * limit

      url = URI("https://tiktok-scraper-api4.p.rapidapi.com/api/v1/search/videos?keyword=#{URI.encode_www_form_component(params[:keyword])}&cursor=#{cursor}&limit=#{limit}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = ENV["RAPIDAPI_KEY"]
      request["x-rapidapi-host"] = ENV["RAPIDAPI_HOST"]

      response = http.request(request)
      result = JSON.parse(response.body)

      puts "API Response: #{result}"

      @videos = result["data"] || []
      @saved_urls = current_user.saved_videos.pluck(:url)
      @next_page = page + 1 if @videos.any?
    else
      @videos = []
    end
  end

  def proxy_video
    encoded_url = params[:url]
    return head :bad_request unless encoded_url.present?

    begin
      decoded_url = CGI.unescape(encoded_url)
      video_data = URI.open(decoded_url,
        "User-Agent" => "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36",
        "Referer" => "https://www.tiktok.com/",
        "Accept" => "*/*",
        "Origin" => "https://www.tiktok.com/",
        "Accept-Language" => "en-US,en;q=0.9",
        ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE
      ).read

      send_data video_data, type: "video/mp4", disposition: "inline"
    rescue OpenURI::HTTPError => e
      Rails.logger.error("Proxy error: #{e.io.status} #{decoded_url}")
      head :not_found
    rescue => e
      Rails.logger.error("Proxy error: #{e.message}")
      head :not_found
    end
  end
end

