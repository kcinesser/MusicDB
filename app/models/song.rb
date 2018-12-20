class Song < ApplicationRecord
  belongs_to :artist

  has_one_attached :tab

  enum status: [:not_started, :in_progress, :proficient, :mastered]
  enum difficulty: [:beginner, :intermediate, :advanced]
  enum instrument: [:guitar, :electric_guitar, :piano]
end
