desc "Parser"
namespace :parse do
  task irr: :environment do
    require 'parser.rb'
  	require 'nokogiri'
    require 'open-uri'
  	url = "http://ufa.irr.ru/real-estate/apartments-sale/search/ab_district=4114109129/rooms=3/currency=RUR/date_create=yesterday/"
  	result = SiteParser::IrrParser.new.parse(url)

  	category_id = Category.find_or_create_by_name(name: result[:category]).id
  	subcategory_id = Category.find_or_create_by_name_and_category_id(name: result[:subcategory], category_id: category_id).id

  	result[:ads].each do |a|
		  Advert.create( content: a[:content], phone: a[:phone], name: a[:name], category_id: subcategory_id )
  	end
  end
end