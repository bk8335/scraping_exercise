require 'rubygems'
require 'httparty'
require 'Nokogiri'
require 'open-uri'

PAGE_URLS =
	[
			"https://www.airbnb.co.uk/rooms/14531512?s=51",
			"https://www.airbnb.co.uk/rooms/19278160?s=51",
			"https://www.airbnb.co.uk/rooms/19292873?s=51"
	]

class Scraper

	def self.scrape
		PAGE_URLS.each do |url|
			page = Nokogiri::HTML(open(url))  
			property_name = page.css('h1')[1].text
			property_type = page.css("span._y8ard79")[1].text
			bedrooms = page.css("span._y8ard79")[2].text
			bathroom = page.css("span._y8ard79")[3].text
			amenities = page.css("div._m7iebup")[2..7].map { |a| a.text }

			puts property_name
			puts property_type
			puts bedrooms
			puts bathroom
			puts amenities
		end
	end
end

Scraper.scrape
