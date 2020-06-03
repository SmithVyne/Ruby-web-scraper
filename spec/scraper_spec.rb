require 'httparty'
require 'nokogiri'
require_relative '../bin/scraper.rb'

describe 'Entire scraper' do
  let(:test_scrape) { Scraper.new }
  let(:test_scraper) { test_scrape.scrape }
  let(:test_all_shoes) { test_scrape.all_shoes }
  describe HandleUrl do
    let(:handled_url) { HandleUrl.new }
    it 'receives the raw wepage' do
      expect(handled_url.raw_webpage).to be_truthy
    end

    it 'parses the webpage' do
      expect(handled_url.webpage_parser).to be_truthy
    end
  end

  describe Scraper do
    it 'gets each shoe row' do
      expect(test_scrape.shoes).to be_truthy
    end

    it 'scrapes the webpage' do
      expect(test_scraper).to be_truthy
    end

    it 'has an array for all scraped shoes' do
      expect(test_all_shoes).to be_truthy
    end

    it 'has a total of ten shoes' do
      test_scraper
      expect(test_all_shoes.count).to eq(10)
    end
  end

  describe 'printer' do
    it 'prints the table of best Nike Air Max' do
      expect(printer(test_all_shoes)).to be_truthy
    end
  end
end
