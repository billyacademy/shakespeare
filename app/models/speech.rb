class Speech < ActiveRecord::Base
  belongs_to :scene
  belongs_to :role
  has_many :lines

  validates :scene_id,
    presence: true

  validates :role_id,
    presence: true

  def self.parse_all(speeches)
    speeches.map do |speech|
      role = Role.find_by(name: speech.xpath('SPEAKER').first.text)
      scene = Scene.find_by(title: speech.parent.xpath("TITLE").text.gsub("\n", '').strip)
      if role != nil
        new_speech = Speech.create(role_id: role.id, scene_id: scene.id)
        speech.xpath('LINE').each do |line|
          Line.create(message: line.children.text.gsub("\n", '').strip, speech_id: new_speech.id)
        end
      end
    end
  end
end
