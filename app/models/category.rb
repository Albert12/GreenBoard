class Category < ActiveRecord::Base
  attr_accessible :name, :category_id
  has_many :adverts

  has_many :subcategories, class_name: "Category", foreign_key: "category_id"
  belongs_to :parentcategory, class_name: "Category", foreign_key: "category_id"

	def self.allcategories
	newcoll = []
    coll = all
    coll.each{ |x|
        parent = x.parentcategory
        if parent != nil
        x[:name] = parent.name + "\\" + x.name
        newcoll << x
        end }
    return newcoll
	end
end
