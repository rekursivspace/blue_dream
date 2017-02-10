class ArtistsController < ApplicationController
  before_action :set_artist, only: [:show, :albums, :tracks]

  # GET /artists
  def index
		begin
			status = 200
			@artists = Artist.page(params[:page])

			@artists_response = @artists.map do |artist|
				{
					uuid: artist.uuid,
					name: artist.name
				}
			end

			@response = {
				meta: {
					code: status,
					pagination: gen_pagination(payload: @artists, page: params[:page])
				},
				data: {
					artists: @artists_response
				}
			}
		rescue Exception => e
			status = 500
			@response = {
				meta: {
					code: status,
					error_message: e
				}
			}
		end

    render json: @response, status: status
  end

  # GET /artists/:uuid
  def show
		begin
			status = 200

			@response = {
				meta: {
					code: status
				},
				data: {
					artist: {
						uuid: @artist.uuid,
						name: @artist.name
					}
				}
			}
		rescue Exception => e
			status = 500
			@response = {
				meta: {
					code: status,
					error_message: e
				}
			}
		end

    render json: @response, status: status
  end
  
	# GET /artists/:uuid/albums
  def albums
		begin
			status = 200
			@albums = @artist.albums.page(params[:page])

			@albums_response = @albums.map do |album|
				{
					uuid: album.uuid,
					name: album.name,
					catalog: album.catalog
				}
			end

			@response = {
				meta: {
					code: status,
					pagination: gen_pagination(payload: @albums, page: params[:page])
				},
				data: {
					albums: @albums_response
				}
			}
		rescue Exception => e
			status = 500
			@response = {
				meta: {
					code: status,
					error_message: e
				}
			}
		end

    render json: @response, status: status
  end
	
	# GET /artists/:uuid/tracks
  def tracks
		begin
			status = 200
			@tracks = @artist.tracks.page(params[:page])

			@tracks_response = @tracks.map do |track|
				{
					uuid: track.uuid,
					name: track.name
				}
			end

			@response = {
				meta: {
					code: status,
					pagination: gen_pagination(payload: @tracks, page: params[:page])
				},
				data: {
					tracks: @tracks_response
				}
			}
		rescue Exception => e
			status = 500
			@response = {
				meta: {
					code: status,
					error_message: e
				}
			}
		end

    render json: @response, status: status
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_artist
      @artist = Artist.find_by_uuid(params[:uuid])
    end

    # Only allow a trusted parameter "white list" through.
    def artist_params
      params.require(:artist).permit(:name)
    end
end
