require "application_system_test_case"

class TransactionsTest < ApplicationSystemTestCase
  setup do
    @my_transaction = transactions(:one)
  end

  test "visiting the index" do
    visit myTransactions_url
    assert_selector "h1", text: "Transactions"
  end

  test "creating a Transaction" do
    visit myTransactions_url
    click_on "New Transaction"

    fill_in "User", with: @my_transaction.user_id
    click_on "Create Transaction"

    assert_text "Transaction was successfully created"
    click_on "Back"
  end

  test "updating a Transaction" do
    visit myTransactions_url
    click_on "Edit", match: :first

    fill_in "User", with: @my_transaction.user_id
    click_on "Update Transaction"

    assert_text "Transaction was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction" do
    visit myTransactions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction was successfully destroyed"
  end
end
