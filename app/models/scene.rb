class Scene < ActiveRecord::Base
  validates :act_id,
    presence: true

  validates :role_id,
    presence: true

  belongs_to :act
  has_many :speeches
end
