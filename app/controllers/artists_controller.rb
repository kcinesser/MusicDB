class ArtistsController < ApplicationController
    def show
        @artist = Artist.find(params[:id])
    end
    
    def new
    end

    def create
        @artist = Artist.new(artist_params)

        @artist.save
        redirect_to @artist
    end

    private

    def artist_params
        params.require(:artist).permit(:name)
    end
end
