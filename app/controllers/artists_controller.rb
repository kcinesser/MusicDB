# frozen_string_literal: true

class ArtistsController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @artists = Artist.all.order("#{sort_column} #{sort_direction}")
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.user = current_user

    if @artist.save
      redirect_to @artist
    else
      render 'new'
    end
  end

  def update
    @artist = Artist.find(params[:id])
    @artist.user = current_user

    if @artist.update(artist_params)
      redirect_to @artist
    else
      render 'edit'
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy

    redirect_to artists_path
  end

  private

  def sortable_columns
    ['name']
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end

  def artist_params
    params.require(:artist).permit(:name, :user_id, :spotify_id, :photo)
  end
end
