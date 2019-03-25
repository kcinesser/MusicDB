# frozen_string_literal: true

class RenameSongColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :songs, :url, :video_url
  end
end
