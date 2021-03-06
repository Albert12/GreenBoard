class Category < ActiveRecord::Base
  attr_accessible :name, :category_id
  has_many :adverts

  has_many :subcategories, class_name: "Category", foreign_key: "category_id"
  belongs_to :parent, class_name: "Category", foreign_key: "category_id"

def ancestors
  result = []
  result << parent if parent.present?
  result
end

def title
  (ancestors + [self]).map(&:name).join(' / ')
end

def self.allcategories
collection = []
    all.each{ |x|
      x[:name] = x.parent.name + " / " + x.name if x.parent.present?
      collection << x
    }
    collection
 end
  
end
