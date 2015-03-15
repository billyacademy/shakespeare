class Play < ActiveRecord::Base
  validates :title,
    presence: true
  has_many :acts
  has_many :roles

  def self.parse(doc)
    doc.css("PLAY TITLE").children.first.text
  end

  def self.create_play(title)
    Play.new(title: title)
  end
end
