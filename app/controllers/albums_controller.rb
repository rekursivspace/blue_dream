class AlbumsController < ApplicationController
  before_action :set_album, only: [:show]

  # GET /albums
  def index
    @albums = Album.all

    render json: @albums
  end

  # GET /albums/:catalog
  def show
    render json: @album
  end
  
	# GET /albums/:catalog/artist
  def artist
    @albums = Album.all

    render json: @albums
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def album_params
      params.require(:album).permit(:name, :catalog)
    end
end
