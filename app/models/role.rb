class Role < ActiveRecord::Base
  belongs_to :play
  has_many :speeches
  has_many :lines, through: :speeches
  has_many :scenes, through: :roles_scenes
  has_many :roles_scenes

  validates :name,
    presence: true

  validates :play_id,
    presence: true

  def self.parse_all(roles, play)
      roles.map { |role| Role.create(name: role.text, play_id: play.id) }
  end

  def self.parse_unlisted(speeches, play)
    speeches.map { |speech| Role.create(name: speech.xpath('SPEAKER').first.text, play_id: play.id) if speech.xpath('SPEAKER').first.text != "All" && Role.find_by(name: speech.xpath('SPEAKER').first.text) == nil }
  end

  def num_of_scenes
    scenes.count
  end

  def percent_of_scenes
    scenes.count.to_f / Scene.all.count*100
  end

  def longest_speech
     max_lines = 0
     speeches.each do |speech|
       if speech.lines.count > max_lines
         max_lines = speech.lines.count
       end
      end
      max_lines
  end

  def num_of_lines
    lines.count
  end
end
