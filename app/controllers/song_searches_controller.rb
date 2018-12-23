class SongSearchesController < ApplicationController
  respond_to :js

  def index
    RSpotify.authenticate("2a406175acb24b7783878e1c0eeb3b32", "a3936b25fd9c4635abc0006ea02c9841")

    @artist = Artist.find(params[:artist_id])
    @search_string = @artist.name.to_s + " " + params[:search]

    if !params[:search].empty?
      @result = RSpotify::Track.search(@search_string)
    else
      redirect_to root_path
    end
  end

  def show
    @result = RSpotify::Track.find(params[:format])
  end
end
