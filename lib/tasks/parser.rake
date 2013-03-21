desc "Parser"
namespace :parse do
  task irr: :environment do
  	require 'parser.rb'
  	require 'nokogiri'
	require 'open-uri'
  	url = "http://ufa.irr.ru/real-estate/apartments-sale/search/ab_district=4114109129/rooms=3/currency=RUR/date_create=yesterday/"
  	result = SiteParser::IrrParser.new.parse(url)

  	category_id = Category.create(name: result[:category]).id
  	subcategory_id = Category.create(name: result[:subcategory], category_id: category_id).id

  	service = ['@mail', '@google', '@yahoo', '@yandex']
  	domain = ['.ru', '.com', '.org', '.net', '.gov']

  	result[:ads].each do |a|

  		email = SecureRandom.hex(4) + service.sample + domain.sample
		phone = rand((1000000..99999999999)).to_s
		icq = rand((1000000..99999999999)).to_s
		skype  = SecureRandom.hex(4)
		name = ('a'..'z').to_a.shuffle[0..(7..11).to_a.sample].join.capitalize

		Advert.create( content: a, email: email, phone: phone, icq: icq, skype: skype, name: name, category_id: subcategory_id )
  	end
  end
end