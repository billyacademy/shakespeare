class Scene < ActiveRecord::Base
  validates :act_id,
    presence: true

  validates :title,
    presence: true

  belongs_to :act
  has_many :speeches
  has_many :roles, through: :roles_scenes

  def self.parse_all(scenes)
    scenes.map { |scene| Scene.create(title: scene.xpath('TITLE').text.gsub("\n", '').strip, act_id: Act.find_by(title: scene.parent.xpath('TITLE').text).id)}
  end
end
