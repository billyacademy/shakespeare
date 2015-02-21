class Line < ActiveRecord::Base
  belongs_to :speech

  validates :message,
    presence: true

  validates :speech_id,
    presence: true
end
