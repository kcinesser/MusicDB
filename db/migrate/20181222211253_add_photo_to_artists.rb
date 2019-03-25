# frozen_string_literal: true

class AddPhotoToArtists < ActiveRecord::Migration[5.2]
  def change
    add_column :artists, :photo, :string
  end
end
