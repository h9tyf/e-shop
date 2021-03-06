require "application_system_test_case"

class ProductOptionsTest < ApplicationSystemTestCase
  setup do
    @product_option = product_options(:one)
  end

  test "visiting the index" do
    visit product_options_url
    assert_selector "h1", text: "Product Options"
  end

  test "creating a Product option" do
    visit product_options_url
    click_on "New Product Option"

    fill_in "Description", with: @product_option.description
    fill_in "Price", with: @product_option.price
    fill_in "Product", with: @product_option.product_id
    click_on "Create Product option"

    assert_text "Product option was successfully created"
    click_on "Back"
  end

  test "updating a Product option" do
    visit product_options_url
    click_on "Edit", match: :first

    fill_in "Description", with: @product_option.description
    fill_in "Price", with: @product_option.price
    fill_in "Product", with: @product_option.product_id
    click_on "Update Product option"

    assert_text "Product option was successfully updated"
    click_on "Back"
  end

  test "destroying a Product option" do
    visit product_options_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Product option was successfully destroyed"
  end
end
