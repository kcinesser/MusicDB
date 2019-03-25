# frozen_string_literal: true

class AddUserRefToArtists < ActiveRecord::Migration[5.2]
  def change
    add_reference :artists, :user, foreign_key: true
  end
end
