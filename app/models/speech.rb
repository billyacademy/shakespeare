class Speech < ActiveRecord::Base
  belongs_to :scene
  belongs_to :role
  has_many :lines

  validates :scene_id,
    presence: true

  validates :role_id,
    presence: true
end
