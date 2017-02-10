class LabelsController < ApplicationController
  before_action :set_label, only: [:show, :albums, :artists]

  # GET /labels
  def index
		begin
			status = 200
			@labels = Label.page(params[:page])

			@labels_response = @labels.map do |label|
				{
					uuid: label.uuid,
					name: label.name
				}
			end

			@response = {
				meta: {
					code: status,
					pagination: gen_pagination(payload: @labels, page: params[:page])
				},
				data: {
					labels: @labels_response
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

  # GET /labels/:uuid
  def show
		begin
			status = 200

			@response = {
				meta: {
					code: status
				},
				data: {
					label: {
						uuid: @label.uuid,
						name: @label.name
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

  # GET /labels/:uuid/albums
  def albums
		begin
			status = 200
			@albums = @label.albums.page(params[:page])

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

  # GET /labels/:uuid/artists
  def artists
		begin
			status = 200
			@artists = @label.artists.page(params[:page])

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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find_by_uuid(params[:uuid])
    end

    # Only allow a trusted parameter "white list" through.
    def label_params
      params.require(:label).permit(:name)
    end
end
