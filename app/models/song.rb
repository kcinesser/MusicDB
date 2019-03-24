# == Schema Information
#
# Table name: songs
#
#  id          :bigint(8)        not null, primary key
#  title       :string(255)
#  artist_id   :bigint(8)
#  status      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  difficulty  :integer
#  instrument  :integer
#  video_url   :string(255)
#  spotify_url :string(255)
#

class Song < ApplicationRecord
  belongs_to :artist

  has_one_attached :tab
  has_many :notes, dependent: :destroy

  enum status: [:not_started, :in_progress, :proficient, :mastered]
  enum instrument: [:guitar, :electric_guitar, :piano]

  def blank_stars
    5 - difficulty.to_i
  end
end
