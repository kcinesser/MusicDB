# frozen_string_literal: true

class NotesController < ApplicationController
  def create
    @song = Song.find(params[:song_id])
    @note = @song.notes.create(note_params)
    redirect_to artist_song_path(@song.artist, @song)
  end

  def destroy
    @song = Song.find(params[:song_id])
    @note = @song.notes.find(params[:id])
    @note.destroy
    redirect_to artist_song_path(@song.artist, @song)
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
