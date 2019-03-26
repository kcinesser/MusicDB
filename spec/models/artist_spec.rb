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

require 'rails_helper'

RSpec.describe Artist, type: :model do
  it { is_expected.to have_one(:name) }
  it { is_expected.to have_one(:photo) }
  it { is_expected.to have_one(:spotify_id) }
  it { is_expected.to have_many(:songs).dependent(:destroy) }
    
  it { is_expected.to validate_presence_of(:name) }
    
end
