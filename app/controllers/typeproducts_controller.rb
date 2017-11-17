class TypeproductsController < ApplicationController
  before_action :set_typeproduct, only: [:show, :update, :destroy]

  # GET /typeproducts
  def index
    @typeproducts = Typeproduct.all

    render json: @typeproducts
  end

  # GET /typeproducts/1
  def show
    render json: @typeproduct
  end

  # POST /typeproducts
  def create
    @typeproduct = Typeproduct.new(typeproduct_params)

    if @typeproduct.save
      render json: @typeproduct, status: :created, location: @typeproduct
    else
      render json: @typeproduct.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /typeproducts/1
  def update
    if @typeproduct.update(typeproduct_params)
      render json: @typeproduct
    else
      render json: @typeproduct.errors, status: :unprocessable_entity
    end
  end

  # DELETE /typeproducts/1
  def destroy
    @typeproduct.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_typeproduct
      @typeproduct = Typeproduct.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def typeproduct_params
      params.require(:typeproduct).permit(:name, :product_id)
    end
end
