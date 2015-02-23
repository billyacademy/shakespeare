class RolesScene < ActiveRecord::Base
  belongs_to :role
  belongs_to :scene

  validates :role_id,
    presence: true

  validates :scene_id,
    presence: true
end
