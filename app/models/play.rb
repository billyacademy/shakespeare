class Play < ApplicationController
  validates :title, presence: true
  has_many :acts
end
