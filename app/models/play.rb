class Play < ActiveRecord::Base
  validates :title,
    presence: true
  has_many :acts
end
