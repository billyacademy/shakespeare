class Act < ActiveRecord::Base
  belongs_to :play
  has_many :scenes

  validates :title, presence: true
end
