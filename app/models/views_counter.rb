class ViewsCounter < ActiveRecord::Base
  attr_accessible :viewable_type, :viewable_id

	def self.counter(type, id)
	  counter = find_or_create_by_viewable_type_and_viewable_id(type, id)
	  counter.increment!(:views_count)
	  counter.views_count
	end
end
