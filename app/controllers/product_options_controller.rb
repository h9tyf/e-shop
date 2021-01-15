class ProductOptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_product_and_shop
  before_action :set_product_option, only: [:show, :edit, :update, :destroy]

  # GET /product_options
  # GET /product_options.json
  def index
    @product_options = @product.product_options
  end

  # GET /product_options/1
  # GET /product_options/1.json
  def show
  end

  # GET /product_options/new
  def new
    @product_option = @product.product_options.build
  end

  # GET /product_options/1/edit
  def edit
  end

  # POST /product_options
  # POST /product_options.json
  def create
    @product_option = @product.product_options.build(product_option_params)
    @product_option.product = @product

    respond_to do |format|
      if @product_option.save
        format.html { redirect_to shop_product_path(@shop, @product), notice: 'Product option was successfully created.' }
        format.json { render :show, status: :created, location: @product_option }
      else
        format.html { render :new }
        format.json { render json: @product_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /product_options/1
  # PATCH/PUT /product_options/1.json
  def update
    respond_to do |format|
      if @product_option.update(product_option_params)
        format.html { redirect_to shop_product_path(@shop, @product), notice: 'Product option was successfully updated.' }
        format.json { render :show, status: :ok, location: @product_option }
      else
        format.html { render :edit }
        format.json { render json: @product_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_options/1
  # DELETE /product_options/1.json
  def destroy
    @product_option.destroy
    respond_to do |format|
      format.html { redirect_to shop_product_path(@shop, @product), notice: 'Product option was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product_option
      @product_option = @product.product_options.find(params[:id])
    end

    def get_product_and_shop
        @product = Product.find(params[:product_id])
        @shop = @product.shop
    end

    # Only allow a list of trusted parameters through.
    def product_option_params
      params.require(:product_option).permit(:description, :price, :product_id)
    end
end
