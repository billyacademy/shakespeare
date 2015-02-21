class Act < ActiveRecord::Base
  validates :title,
    presence: true

  belongs_to :play
  has_many :scenes

end
