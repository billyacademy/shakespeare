class Role < ActiveRecord::Base
  validates :name,
    presence: true

  validates :play_id,
    presence: true

  belongs_to :play
  has_many :speeches
end
