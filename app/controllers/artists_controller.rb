class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show]

  # GET /artists
  def index
    @artists = Artist.all

    render json: @artists
  end

  # GET /artists/:artist-slug
  def show
    render json: @artist
  end
  
	# GET /artists/:artist-slug/albums
  def albums
    @artists = Artist.all

    render json: @artists
  end
	
	# GET /artists/:artist-slug/tracks
  def tracks
    @artists = Artist.all

    render json: @artists
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_params
      params.require(:artist).permit(:name)
    end
end
