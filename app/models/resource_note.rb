# frozen_string_literal: true

# == Schema Information
#
# Table name: resource_notes
#
#  id          :bigint(8)        not null, primary key
#  body        :text(65535)
#  resource_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class ResourceNote < ApplicationRecord
  belongs_to :resource
end
