require "application_system_test_case"
class CartsTest < ApplicationSystemTestCase
  test "check cart appearance" do
    visit store_index_url

    click_on "Add to Cart", match: :first

    assert_text 'Your Cart'

    click_on "Empty Cart", match: :first

    assert assert_no_text 'Your Cart'
  end

  test "line item change color when update quantity" do
    visit store_index_url

    assert_no_selector ".line-item-highlight"

    click_on "Add to Cart", match: :first

    assert_selector ".line-item-highlight"
  end
end
