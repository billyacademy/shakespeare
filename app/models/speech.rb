class Speech < ActiveRecord::Base
  belongs_to :scene
  belongs_to :role
  has_many :lines

  validates :scene_id,
    presence: true

  validates :role_id,
    presence: true

  extend ApplicationHelper

  def self.parse_all(speeches)
    speeches.map do |speech|
      role = Role.find_by(name: speech.xpath('SPEAKER').first.text)
      scene = Scene.find_by(title: speech.parent.xpath("TITLE").text.gsub("\n", '').strip)
      create_line(speech, role, scene)
    end
  end
end
