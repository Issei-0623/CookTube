require 'open-uri'
require 'nokogiri'
require 'uri'

keyword = "親子丼"
encoded_keyword = URI.encode_www_form_component(keyword)
url = "https://www.tiktok.com/search?q=#{encoded_keyword}"

html = URI.open(url).read
doc = Nokogiri::HTML(html)

puts "ページタイトル: #{doc.title}"
puts doc.to_html[0..1000]
