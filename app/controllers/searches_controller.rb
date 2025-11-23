require 'net/http'
require 'uri'
require 'json'
require 'open-uri'

class SearchesController < ApplicationController
  def index
    if params[:keyword].present?
      url = URI("https://tiktok-scraper-api4.p.rapidapi.com/api/v1/search/videos?keyword=#{URI.encode_www_form_component(params[:keyword])}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true

      request = Net::HTTP::Get.new(url)
      request["x-rapidapi-key"] = ENV['RAPIDAPI_KEY']
      request["x-rapidapi-host"] = ENV['RAPIDAPI_HOST']

      response = http.request(request)
      result = JSON.parse(response.body)

      puts "API Response: #{result}"

      @videos = result["data"] || []
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
        "Accept-Language" => "en-US,en;q=0.9",
        "Origin" => "https://www.tiktok.com",
        ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE # ← SSL証明書チェックを無効化
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
