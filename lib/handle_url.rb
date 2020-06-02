require 'httparty'
require 'nokogiri'
require 'byebug'

class HandleUrl
  attr_accessor :raw_webpage
  def initialize
    url = 'https://www.walkjogrun.net/best-nike-air-max-shoes-reviewed/'
    @raw_webpage = HTTParty.get(url)
  end

  def webpage_parser
    parsed_webpage = Nokogiri::HTML(raw_webpage.body)
    parsed_webpage
  end
end
