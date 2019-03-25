# frozen_string_literal: true

class AddInstrumentToSongs < ActiveRecord::Migration[5.2]
  def change
    add_column :songs, :instrument, :integer
  end
end
