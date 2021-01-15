require 'test_helper'

class TransactionProductTablesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transaction_product_table = transaction_product_tables(:one)
  end

  test "should get index" do
    get transaction_product_tables_url
    assert_response :success
  end

  test "should get new" do
    get new_transaction_product_table_url
    assert_response :success
  end

  test "should create transaction_product_table" do
    assert_difference('TransactionProductTable.count') do
      post transaction_product_tables_url, params: { transaction_product_table: { product_option_id: @transaction_product_table.product_option_id, transaction_id: @transaction_product_table.transaction_id } }
    end

    assert_redirected_to transaction_product_table_url(TransactionProductTable.last)
  end

  test "should show transaction_product_table" do
    get transaction_product_table_url(@transaction_product_table)
    assert_response :success
  end

  test "should get edit" do
    get edit_transaction_product_table_url(@transaction_product_table)
    assert_response :success
  end

  test "should update transaction_product_table" do
    patch transaction_product_table_url(@transaction_product_table), params: { transaction_product_table: { product_option_id: @transaction_product_table.product_option_id, transaction_id: @transaction_product_table.transaction_id } }
    assert_redirected_to transaction_product_table_url(@transaction_product_table)
  end

  test "should destroy transaction_product_table" do
    assert_difference('TransactionProductTable.count', -1) do
      delete transaction_product_table_url(@transaction_product_table)
    end

    assert_redirected_to transaction_product_tables_url
  end
end
