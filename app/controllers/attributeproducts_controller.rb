class AttributeproductsController < ApplicationController
  before_action :set_attributeproduct, only: [:show, :update, :destroy]

  # GET /attributeproducts
  def index
    @attributeproducts = Attributeproduct.all

    render json: @attributeproducts
  end

  # GET /attributeproducts/1
  def show
    render json: @attributeproduct
  end

  # POST /attributeproducts
  def create
    @attributeproduct = Attributeproduct.new(attributeproduct_params)

    if @attributeproduct.save
      render json: @attributeproduct, status: :created, location: @attributeproduct
    else
      render json: @attributeproduct.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /attributeproducts/1
  def update
    if @attributeproduct.update(attributeproduct_params)
      render json: @attributeproduct
    else
      render json: @attributeproduct.errors, status: :unprocessable_entity
    end
  end

  # DELETE /attributeproducts/1
  def destroy
    @attributeproduct.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_attributeproduct
      @attributeproduct = Attributeproduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def attributeproduct_params
      params.require(:attributeproduct).permit(:range, :typeproduct_id, :feature_id)
    end
end
