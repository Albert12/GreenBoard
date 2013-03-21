module SiteParser
	class IrrParser
		def parse(url)
			doc = Nokogiri::HTML(open(url))
			result = {}
			result[:category] = doc.css("#bcPopup2 .title a").text
			result[:subcategory] = doc.css("#bcPopup633 .title a").text
			result[:ads] = doc.css("tr .h3 a").map(&:text)
			result
		end
	end
end