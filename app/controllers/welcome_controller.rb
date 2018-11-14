class WelcomeController < ApplicationController
  def index
    @songs = @artist.present? ?  @artist.songs : Song.all
    @artists = Artist.all
  end
end
