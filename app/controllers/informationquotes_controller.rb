class InformationquotesController < ApplicationController
  before_action :set_informationquote, only: [:show, :update, :destroy]

  # GET /informationquotes
  def index
    @informationquotes = Informationquote.all

    render json: @informationquotes
  end

  # GET /informationquotes/1
  def show
    render json: @informationquote
  end

  # POST /informationquotes
  def create
    @informationquote = Informationquote.new(informationquote_params)

    if @informationquote.save
      render json: @informationquote, status: :created, location: @informationquote
    else
      render json: @informationquote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /informationquotes/1
  def update
    if @informationquote.update(informationquote_params)
      render json: @informationquote
    else
      render json: @informationquote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /informationquotes/1
  def destroy
    @informationquote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_informationquote
      @informationquote = Informationquote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def informationquote_params
      params.require(:informationquote).permit(:value, :quote_id, :attributeproduct_id)
    end
end
