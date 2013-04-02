# encoding: utf-8
module SiteParser

require "nokogiri"
require "open-uri"

	class IrrParser
		def parse(url)
			doc = Nokogiri::HTML(open(url))

			result = {}
			result[:category] = doc.css("#bcPopup2 .title a").text
			result[:subcategory] = doc.css("#bcPopup633 .title a").text
  		result[:ads] = []

			doc.css("tr .h3 a").reverse.each{ |x|

				original_ad_url = x["href"]
				i = 0
				while i < 3 do
					doc_ad = Nokogiri::HTML(open(original_ad_url))
						if doc_ad.css(".ico-set.ico-phone")[0] then
							ad = {}
							ad[:content] = doc_ad.css(".txtAdvert .advert_text").text + doc_ad.css(".txtAdvert .continuation").text
							ad[:name] = doc_ad.css(".padB10.nameConpany b").text
							ad[:phone] = (doc_ad.css(".ico-set.ico-phone")[0]).parent().text
							ad[:price] = doc_ad.css("#priceSelected").text.scan(/\d+/).join.to_i
							ad[:original_ad_url] = original_ad_url
							result[:ads] << ad
							i = 3
						end
					i += 1
				end

				if i == 3 then 
					puts "#{original_ad_url} failed to load 3 times, skipped"
				end
			}
			result
		end
	end

	class AvitoParser
		def parse(url)
			doc = Nokogiri::HTML(open(url))

			result = {}
			result[:category] = doc.css(".catalog_breadcrumbs-link.second-link span")[1].text
			result[:subcategory] = doc.css(".catalog_breadcrumbs-link.second-link span")[2].text + '.' + doc.css(".catalog_breadcrumbs-link.second-link span")[3].text
			result[:ads] = []

			doc.css(".t_i_h3 a").reverse.each{ |x|

				original_ad_url = "http://www.avito.ru" + x["href"]
				i = 0
				while i < 3 do
					doc_ad = Nokogiri::HTML(open(original_ad_url))
						if doc_ad.css("#desc_text")[0] then
							ad = {}
							ad[:content] = doc_ad.css("#desc_text").text
							ad[:name] = doc_ad.css("#seller strong").text
							ad[:price] = doc_ad.css(".p_i_price strong span").text.scan(/\d+/).join.to_i
							ad[:original_ad_url] = original_ad_url
							result[:ads] << ad
							i = 3
						end
					i += 1
				end

				if i == 3 then 
					puts "#{original_ad_url} failed to load 3 times, skipped"
				end
			}
			result
		end
	end	

end