# frozen_string_literal: true

class AddSpotifyToSong < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :spotify_url, :string
  end
end
