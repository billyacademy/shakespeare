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
