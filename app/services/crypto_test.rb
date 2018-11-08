class CryptoTest
  def perform
  require 'rubygems'
  require 'nokogiri'
  require 'open-uri'
  page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
  	value_array = []
  	x = 0
  	page.css("a.price").each do |n|
  		value_array[x] = n["data-usd"]
  		x += 1
  	end
  	currency_array = []
  	y = 0
  	page.css("a.currency-name-container").each do |k|
  		currency_array[y] = k.content
  		y += 1
  	end
	i = 0
	while currency_array[i]
		Crypto.create(name: currency_array[i], value: value_array[i])
		i += 1
	end
end
end
