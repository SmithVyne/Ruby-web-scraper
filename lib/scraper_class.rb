require 'httparty'
require 'nokogiri'
require 'byebug'
require_relative '../lib/handle_url.rb'

class Scraper
  attr_accessor :all_shoes
  attr_reader :shoes

  def initialize
    parsed_webpage = HandleUrl.new.webpage_parser
    @shoes = parsed_webpage.css('div.top10-table-row').css('.top10-table-helper')
    @all_shoes = []
  end

  def scrape
    shoes.each do |a_shoe|
      shoe = {
        name: a_shoe.css('a.top10-product-title').text,
        rating: a_shoe.css('.top10-rating-counter').text
      }
      all_shoes << shoe
    end
  end
end
