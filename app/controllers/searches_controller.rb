require 'net/http'
require 'uri'
require 'json'

class SearchesController < ApplicationController
  def index
    if params[:keyword].present?
      url = URI("https://tiktok-scraper-api4.p.rapidapi.com/api/v1/search/live?keyword=#{params[:keyword]}")

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
end
