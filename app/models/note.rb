# frozen_string_literal: true

# == Schema Information
#
# Table name: notes
#
#  id         :bigint(8)        not null, primary key
#  body       :text(65535)
#  song_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Note < ApplicationRecord
  belongs_to :song
end
