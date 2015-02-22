class Scene < ActiveRecord::Base
  validates :act_id,
    presence: true

  validates :title,
    presence: true

  belongs_to :act
  has_many :speeches
  has_many :roles, through: :roles_scenes
end
