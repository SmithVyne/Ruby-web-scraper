require_relative '../lib/scraper_class.rb'

def printer(all_shoes)
  puts ''
  puts 'Ranks' + ' ' * 7 + 'Shoe Name'
  puts '-' * 20

  all_shoes.each do |a_shoe|
    puts a_shoe[:rating] + ' ' * (10 - a_shoe[:rating].length) + a_shoe[:name]
  end
end

new_scraper = Scraper.new
new_scraper.scrape
all_shoes = new_scraper.all_shoes

printer(all_shoes)
