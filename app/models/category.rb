class Category < ActiveRecord::Base
  attr_accessible :name, :category_id
  has_many :adverts

  has_many :subcategories, class_name: "Category", foreign_key: "category_id"
  belongs_to :parentcategory, class_name: "Category", foreign_key: "category_id"
end
