class LabelsController < ApplicationController
  before_action :set_label, only: [:show]

  # GET /labels
  def index
    @labels = Label.all

    render json: @labels
  end

  # GET /labels/:label-slug
  def show
    render json: @label
  end

  # GET /labels/:label-slug/albums
  def albums
    render json: @label
  end

  # GET /labels/:label-slug/artists
  def artists
    render json: @label
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_label
      @label = Label.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def label_params
      params.require(:label).permit(:name)
    end
end
