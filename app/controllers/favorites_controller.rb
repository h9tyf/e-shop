class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_favorite, only: [ :destroy]

  # GET /favorites
  # GET /favorites.json
  def index
    @favorites = Favorite.all
  end

  # GET /favorites/new
  def new
    @favorite = Favorite.new
  end


  # POST /favorites
  # POST /favorites.json
  def create
    @favorite = Favorite.new()
    @favorite.user = User.find(params[:user_id])
    @favorite.product = Product.find(params[:product_id])

    respond_to do |format|
      if @favorite.save
        format.html { redirect_to home_path, notice: 'Favorite was successfully created.' }
        format.json { render :show, status: :created, location: @favorite }
      else
        format.html { render :new }
        format.json { render json: @favorite.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /favorites/1
  # DELETE /favorites/1.json
  def destroy
    @favorite.destroy
    respond_to do |format|
      format.html { redirect_to favorites_url, notice: 'Favorite was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite
      @favorite = Favorite.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorite_params
      params.require(:favorite).permit(:user_id, :product_id)
    end
end
