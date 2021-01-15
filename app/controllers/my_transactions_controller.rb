class MyTransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def index
    @my_transactions = MyTransaction.all
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @my_transaction = MyTransaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @my_transaction = MyTransaction.new(transaction_params)
    @my_transaction.user = User.find(params[:user_id])
    Cart.all.each do |cart|
        if cart.user.id == @my_transaction.user.id
          Cart.delete(cart)
          @transaction_product_table = TransactionProductTable.new
          @transaction_product_table.my_transaction = @my_transaction
          @transaction_product_table.product_option = cart.product_option
          @transaction_product_table.save
          @sold = Sold.new
          @sold.product_option = cart.product_option
          @sold.user = current_user
          @sold.amount = cart.product_option.price
          @sold.address = @my_transaction.address
          @sold.phone = @my_transaction.phone
          @sold.save
        end
    end

    respond_to do |format|
      if @my_transaction.save
        format.html { redirect_to @my_transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @my_transaction }
      else
        format.html { render :new }
        format.json { render json: @my_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @my_transaction.update(transaction_params)
        format.html { redirect_to @my_transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @my_transaction }
      else
        format.html { render :edit }
        format.json { render json: @my_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @my_transaction.destroy
    respond_to do |format|
      format.html { redirect_to my_transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @my_transaction = MyTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:my_transaction).permit(:user_id, :address, :phone)
    end
end
