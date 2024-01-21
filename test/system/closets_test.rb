require "application_system_test_case"

class ClosetsTest < ApplicationSystemTestCase
  setup do
    @closet = closets(:one)
  end

  test "visiting the index" do
    visit closets_url
    assert_selector "h1", text: "Closets"
  end

  test "should create closet" do
    visit closets_url
    click_on "New closet"

    fill_in "Category", with: @closet.category_id
    fill_in "Color", with: @closet.color
    fill_in "Image", with: @closet.image
    fill_in "Name", with: @closet.name
    fill_in "Other comments", with: @closet.other_comments
    fill_in "Price", with: @closet.price
    fill_in "Purchase date", with: @closet.purchase_date
    fill_in "Purchase location", with: @closet.purchase_location
    fill_in "Season", with: @closet.season
    fill_in "Size", with: @closet.size
    fill_in "Subcategory", with: @closet.subcategory_id
    fill_in "Usage frequency", with: @closet.usage_frequency
    click_on "Create Closet"

    assert_text "Closet was successfully created"
    click_on "Back"
  end

  test "should update Closet" do
    visit closet_url(@closet)
    click_on "Edit this closet", match: :first

    fill_in "Category", with: @closet.category_id
    fill_in "Color", with: @closet.color
    fill_in "Image", with: @closet.image
    fill_in "Name", with: @closet.name
    fill_in "Other comments", with: @closet.other_comments
    fill_in "Price", with: @closet.price
    fill_in "Purchase date", with: @closet.purchase_date
    fill_in "Purchase location", with: @closet.purchase_location
    fill_in "Season", with: @closet.season
    fill_in "Size", with: @closet.size
    fill_in "Subcategory", with: @closet.subcategory_id
    fill_in "Usage frequency", with: @closet.usage_frequency
    click_on "Update Closet"

    assert_text "Closet was successfully updated"
    click_on "Back"
  end

  test "should destroy Closet" do
    visit closet_url(@closet)
    click_on "Destroy this closet", match: :first

    assert_text "Closet was successfully destroyed"
  end
end
