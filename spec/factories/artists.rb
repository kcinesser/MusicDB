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

FactoryBot.define do
    factory :artist do
      name "Test Artist"
      spotify_id "spotify id"
      photo "photo"     
    end
  end
