class Song < ApplicationRecord
  belongs_to :artist

  has_one_attached :tab

  enum status: [:not_started, :in_progress, :proficient, :mastered]
end
