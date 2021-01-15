class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart, only: [:update, :destroy]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
    @my_transaction = MyTransaction.new
  end


  # GET /carts/new
  def new
    @cart = Cart.new
  end


  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new
    @cart.user = User.find(params[:user_id])
    @cart.product_option = ProductOption.find(params[:product_option_id])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to home_path, notice: 'Cart was successfully created.' }
        format.json { render :show, status: :created, location: @cart }
      else
        format.html { render :new }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to home_path, notice: 'Cart was successfully updated.' }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart.destroy
    respond_to do |format|
      format.html { redirect_to carts_url, notice: 'Cart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
      @cart = Cart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cart_params
      params.require(:cart).permit(:user_id, :product_option_id)
    end
end
