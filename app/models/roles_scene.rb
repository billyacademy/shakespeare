class RolesScene < ActiveRecord::Base
  belongs_to :role
  belongs_to :scene

  validates :role_id,
    presence: true

  validates :scene_id,
    presence: true

  def self.parse_all(speakers)
    speakers.map do |speaker|
      role_scene_criteria = RolesScene.find_by(scene_id: Scene.find_by(title: speaker.parent.parent.children.first.text.gsub("\n", '').strip).id, role_id: Role.find_by(name: speaker.text).try(:id))
      if role_scene_criteria == nil && speaker.text != "All"
        RolesScene.create(scene_id: Scene.find_by(title: speaker.parent.parent.children.first.text.gsub("\n", '').strip).id, role_id: Role.find_by(name: speaker.text).id)
      end
    end
  end
end
