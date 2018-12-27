class Resource < ApplicationRecord
  belongs_to :user

  has_one_attached :pdf
  has_many :resource_notes
end
