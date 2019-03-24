# == Schema Information
#
# Table name: resources
#
#  id         :bigint(8)        not null, primary key
#  user_id    :bigint(8)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)
#

class Resource < ApplicationRecord
  belongs_to :user

  has_one_attached :pdf
  has_many :resource_notes
end
