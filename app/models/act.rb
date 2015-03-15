class Act < ActiveRecord::Base
  validates :title,
    presence: true

  belongs_to :play
  has_many :scenes

  def self.parse_all(acts, play)
    acts.map { |act| Act.create(title: (act).xpath('TITLE').text, play_id: play.id) }
  end
end
