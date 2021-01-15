require 'test_helper'

class TransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @my_transaction = transactions(:one)
  end

  test "should get index" do
    get myTransactions_url
    assert_response :success
  end

  test "should get new" do
    get new_myTransaction_url
    assert_response :success
  end

  test "should create transaction" do
    assert_difference('Transaction.count') do
      post myTransactions_url, params: {my_transaction: {user_id: @my_transaction.user_id } }
    end

    assert_redirected_to myTransaction_url(MyTransaction.last)
  end

  test "should show transaction" do
    get myTransaction_url(@my_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_myTransaction_url(@my_transaction)
    assert_response :success
  end

  test "should update transaction" do
    patch myTransaction_url(@my_transaction), params: {my_transaction: {user_id: @my_transaction.user_id } }
    assert_redirected_to myTransaction_url(@my_transaction)
  end

  test "should destroy transaction" do
    assert_difference('Transaction.count', -1) do
      delete myTransaction_url(@my_transaction)
    end

    assert_redirected_to myTransactions_url
  end
end
