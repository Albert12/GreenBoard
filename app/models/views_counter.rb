class ViewsCounter < ActiveRecord::Base
  attr_accessible :vcount, :view

  	def self.counter(viewstring)
  		@counter = find_or_create_by_view(view: viewstring, vcount: 0)
  		@counter_id = @counter.id
    	increment_counter(:vcount, @counter_id)
    	return find(@counter_id).vcount.to_s
	end
end
