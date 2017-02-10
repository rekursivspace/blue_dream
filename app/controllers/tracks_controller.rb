class TracksController < ApplicationController
  before_action :set_track, only: [:show]

  # GET /tracks
  def index
    @tracks = Track.all

    render json: @tracks
  end

  # GET /tracks/:track-uuid
  def show
    render json: @track
  end

  # GET /tracks/:track-uuid/album
  def album
    render json: @track
  end

  # GET /tracks/:track-uuid/artist
  def artist
    render json: @track
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_track
      @track = Track.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def track_params
      params.require(:track).permit(:name)
    end
end
