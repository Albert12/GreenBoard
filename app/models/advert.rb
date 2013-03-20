class Advert < ActiveRecord::Base
  attr_accessible :content, :email, :phone, :icq, :skype, :name, :category_id
  validates :content, :category_id, presence: true
  VALID_PHONE_REGEX = /\d/
  validates :phone, presence: true, length: { minimum: 7, maximum: 11 },
  					format: { with: VALID_PHONE_REGEX }
  belongs_to :category
end
