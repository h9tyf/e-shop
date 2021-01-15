require "application_system_test_case"

class TransactionProductTablesTest < ApplicationSystemTestCase
  setup do
    @transaction_product_table = transaction_product_tables(:one)
  end

  test "visiting the index" do
    visit transaction_product_tables_url
    assert_selector "h1", text: "Transaction Product Tables"
  end

  test "creating a Transaction product table" do
    visit transaction_product_tables_url
    click_on "New Transaction Product Table"

    fill_in "Product option", with: @transaction_product_table.product_option_id
    fill_in "Transaction", with: @transaction_product_table.transaction_id
    click_on "Create Transaction product table"

    assert_text "Transaction product table was successfully created"
    click_on "Back"
  end

  test "updating a Transaction product table" do
    visit transaction_product_tables_url
    click_on "Edit", match: :first

    fill_in "Product option", with: @transaction_product_table.product_option_id
    fill_in "Transaction", with: @transaction_product_table.transaction_id
    click_on "Update Transaction product table"

    assert_text "Transaction product table was successfully updated"
    click_on "Back"
  end

  test "destroying a Transaction product table" do
    visit transaction_product_tables_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Transaction product table was successfully destroyed"
  end
end
