# frozen_string_literal: true

# == Schema Information
#
# Table name: artists
#
#  id         :bigint(8)        not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  spotify_id :string(255)
#  photo      :string(255)
#

class Artist < ApplicationRecord
  belongs_to :user

  has_many :songs, dependent: :destroy
  accepts_nested_attributes_for :songs
  validates :name, presence: true, uniqueness: true
end
