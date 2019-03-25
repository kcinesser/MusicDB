# frozen_string_literal: true

class AddVideoToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :url, :string
  end
end
