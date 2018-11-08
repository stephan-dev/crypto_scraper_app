
require 'rubygems'
require 'nokogiri'
require 'open-uri'

class StartScrape
	def initialize
		@page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
	end

	def scrape
   list_line = @page.xpath('//*[@id="currencies-all"]/tbody/tr')
   list_currencies = Array.new
   list_line.each { | line |

      coin = Hash.new
      currency = line.xpath('td[2]/a')
      rates = line.xpath('td[8]')

      coin['currency'] = currency.text
      coin['rates'] = rates.text

      list_currencies.push(coin)
   		}

      return (list_currencies)

	end

	def save
    list_currencies = scrape
    puts list_currencies
    list_currencies.each do |hash|
      Rate.create(name: hash['currency'], value: hash['rates'])
    end
	end

	def perform
		save
	end
end

#StartScrape.new.perform