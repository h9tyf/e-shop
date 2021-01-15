class TransactionProductTablesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction_product_table, only: [:show, :edit, :update, :destroy]

  # GET /transaction_product_tables
  # GET /transaction_product_tables.json
  def index
    @transaction_product_tables = TransactionProductTable.all
  end

  # GET /transaction_product_tables/1
  # GET /transaction_product_tables/1.json
  def show
  end

  # GET /transaction_product_tables/new
  def new
    @transaction_product_table = TransactionProductTable.new
  end

  # GET /transaction_product_tables/1/edit
  def edit
  end

  # POST /transaction_product_tables
  # POST /transaction_product_tables.json
  def create
    @transaction_product_table = TransactionProductTable.new(transaction_product_table_params)

    respond_to do |format|
      if @transaction_product_table.save
        format.html { redirect_to @transaction_product_table, notice: 'Transaction product table was successfully created.' }
        format.json { render :show, status: :created, location: @transaction_product_table }
      else
        format.html { render :new }
        format.json { render json: @transaction_product_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transaction_product_tables/1
  # PATCH/PUT /transaction_product_tables/1.json
  def update
    respond_to do |format|
      if @transaction_product_table.update(transaction_product_table_params)
        format.html { redirect_to @transaction_product_table, notice: 'Transaction product table was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction_product_table }
      else
        format.html { render :edit }
        format.json { render json: @transaction_product_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transaction_product_tables/1
  # DELETE /transaction_product_tables/1.json
  def destroy
    @transaction_product_table.destroy
    respond_to do |format|
      format.html { redirect_to transaction_product_tables_url, notice: 'Transaction product table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction_product_table
      @transaction_product_table = TransactionProductTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_product_table_params
      params.require(:transaction_product_table).permit(:my_transaction_id, :product_option_id)
    end
end
