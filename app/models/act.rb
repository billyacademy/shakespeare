class Act < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :play
end
