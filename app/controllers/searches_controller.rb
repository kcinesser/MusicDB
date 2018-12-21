class SearchesController < ApplicationController
  def index
    RSpotify.authenticate("2a406175acb24b7783878e1c0eeb3b32", "a3936b25fd9c4635abc0006ea02c9841")

    if !params[:search].empty?
     @search_artists = RSpotify::Artist.search(params[:search])
   else
     redirect_to root_path
   end
  end

  def show
    @result = RSpotify::Artist.find(params[:format])
  end
end
