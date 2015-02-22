class Role < ActiveRecord::Base
  validates :name,
    presence: true

  validates :play_id,
    presence: true

  belongs_to :play
  has_many :speeches
  has_many :lines, through: :speeches
  has_many :scenes, through: :roles_scenes
  has_many :roles_scenes
end
