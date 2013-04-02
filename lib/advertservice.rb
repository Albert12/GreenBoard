class AdvertService

		def self.create!(ad, subcategory_id)
			matched_ad = matched_ad?(ad)[0]
	    if matched_ad then
	    	if matched_ad.original_ad_url != ad[:original_ad_url] then
	    		matched_ad.update_attribute(:original_ad_url, ad[:original_ad_url])
	    	end
	    	if matched_ad.phone != ad[:phone] then
	    		matched_ad.update_attribute(:phone, ad[:phone])
	    	end
	    	if matched_ad.name != ad[:name] then
	    		matched_ad.update_attribute(:name, ad[:name])
	    	end
	    	if matched_ad.price != ad[:price] then
	    		matched_ad.update_attribute(:price, ad[:price])
	    	end
	  	else
	  		ad[:category_id] = subcategory_id
	  		Advert.create!(ad)
	  	end
		end

  	def self.matched_ad?(adv)
			target_content = adv[:content].scan(/\d+/).sort
	    Advert.all.each { |a|
	    	return ([] << a) if (a.content.scan(/\d+/).sort == target_content)
	    }
	    []
	  end
end