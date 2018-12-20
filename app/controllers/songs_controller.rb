class SongsController < ApplicationController
    before_action :load_artist

    def load_artist
        @artist = Artist.find(params[:artist_id]) if params[:artist_id].present?
    end

    def index
        @songs = @artist.present? ?  @artist.songs : Song.all
    end

    def show
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.find(params[:id])
    end

    def edit
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.find(params[:id])
    end

    def new
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.build
    end

    def create
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.create(song_params)
        redirect_to artist_path(@artist)
    end

    def update
        @artist = Artist.find(params[:artist_id])
        @song = Song.find(params[:id])

        if @song.update(song_params)
            redirect_to @artist
        else
            render 'edit'
        end
    end
    
    def destroy
        @artist = Artist.find(params[:artist_id])
        @song = @artist.songs.find(params[:id])
        @song.destroy

        redirect_back fallback_location: root_path
    end

    private

    def song_params
        params.require(:song).permit(:title, :tab, :status, :difficulty, :instrument)
    end
end
