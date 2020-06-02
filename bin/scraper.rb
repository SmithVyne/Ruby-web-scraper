require 'httparty'
require 'nokogiri'
require 'byebug'

def scraper
  url = "https://www.walkjogrun.net/best-nike-air-max-shoes-reviewed/"
  raw_webpage = HTTParty.get(url)
  parsed_webpage = Nokogiri::HTML(raw_webpage.body)
  shoes = parsed_webpage.css('div.top10-table-row').css('.top10-table-helper')
  all_shoes = []

  shoes.each do |a_shoe|
    shoe = {
      name: a_shoe.css('a.top10-product-title').text,
      rating: a_shoe.css('.top10-rating-counter').text
    }
    all_shoes << shoe
  end

  puts all_shoes
end

scraper