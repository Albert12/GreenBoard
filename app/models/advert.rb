class Advert < ActiveRecord::Base
  attr_accessible :content, :email, :phone, :icq, :skype, :name, :price, :original_ad_url, :category_id

  validates :content, :category_id, presence: true
  #validates :phone, presence: true, length: { minimum: 7, maximum: 30 },
  #				numericality: { only_integer: true }
  validates :price, length: { maximum: 12 }, allow_nil: true,
  				numericality: { only_integer: true }
  belongs_to :category
end
