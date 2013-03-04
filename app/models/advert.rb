#
#  id         :integer          not null, primary key
#  content    :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Advert < ActiveRecord::Base
  attr_accessible :content, :created_at, :id
  validates :content, presence: true
end
