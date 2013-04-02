desc "Parser"
namespace :parse do

  task irr: :environment do
    require 'parser.rb'
    require 'advertservice.rb'

  	url = "http://ufa.irr.ru/real-estate/apartments-sale/search/ab_district=4114109129/rooms=3/currency=RUR/date_create=yesterday/"
  	result = SiteParser::IrrParser.new.parse(url)

    category_id = Category.find_or_create_by_name(name: result[:category]).id
    subcategory_id = Category.find_or_create_by_name_and_category_id(name: result[:subcategory], category_id: category_id).id

  	result[:ads].each do |ad|
      AdvertService.create!(ad, subcategory_id)
  	end
  end

  task avito: :environment do
    require 'parser.rb'
    require 'advertservice.rb'

    url = "http://www.avito.ru/ufa/kvartiry?params=201_1059.549_5698"
    result = SiteParser::AvitoParser.new.parse(url)

    category_id = Category.find_or_create_by_name(name: result[:category]).id
    subcategory_id = Category.find_or_create_by_name_and_category_id(name: result[:subcategory], category_id: category_id).id

    result[:ads].each do |ad|
      AdvertService.create!(ad, subcategory_id)
    end
  end
end