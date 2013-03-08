#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Advert < ActiveRecord::Base
  attr_accessible :content, :id, :email, :phone, :icq, :skype, :name, :category_id
  validates :content, presence: true
  VALID_PHONE_REGEX = /\d/
  validates :phone, presence: true, length: { minimum: 7, maximum: 11 },
  					format: { with: VALID_PHONE_REGEX }
  belongs_to :category
end
