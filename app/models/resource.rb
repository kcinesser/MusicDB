class Resource < ApplicationRecord
  belongs_to :user

  has_one_attached :pdf
end
