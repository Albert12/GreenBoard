module SiteParser
	class IrrParser
		def parse(url)
			doc = Nokogiri::HTML(open(url))
			result = {}
			result[:category] = doc.css("#bcPopup2 .title a").text
			result[:subcategory] = doc.css("#bcPopup633 .title a").text
			result[:ads] = doc.css("tr .h3 a").map{ |x|

				doc_ad = Nokogiri::HTML(open(x['href']))
				ad = {}
				ad[:content] = doc_ad.css('.advert_text').text
				ad[:name] = doc_ad.css('.padB10.nameConpany b').text
				ad[:phone] = (doc_ad.css('.ico-set.ico-phone')[0]).parent().text
				ad
			}
			result
		end
	end
end