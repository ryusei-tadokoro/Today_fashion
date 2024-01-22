require "test_helper"

class ClosetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @closet = closets(:one)
  end

  test "should get index" do
    get closets_url
    assert_response :success
  end

  test "should get new" do
    get new_closet_url
    assert_response :success
  end

  test "should create closet" do
    assert_difference("Closet.count") do
      post closets_url, params: { closet: { category_id: @closet.category_id, color: @closet.color, image: @closet.image, name: @closet.name, other_comments: @closet.other_comments, price: @closet.price, purchase_date: @closet.purchase_date, purchase_location: @closet.purchase_location, season: @closet.season, size: @closet.size, subcategory_id: @closet.subcategory_id, usage_frequency: @closet.usage_frequency } }
    end

    assert_redirected_to closet_url(Closet.last)
  end

  test "should show closet" do
    get closet_url(@closet)
    assert_response :success
  end

  test "should get edit" do
    get edit_closet_url(@closet)
    assert_response :success
  end

  test "should update closet" do
    patch closet_url(@closet), params: { closet: { category_id: @closet.category_id, color: @closet.color, image: @closet.image, name: @closet.name, other_comments: @closet.other_comments, price: @closet.price, purchase_date: @closet.purchase_date, purchase_location: @closet.purchase_location, season: @closet.season, size: @closet.size, subcategory_id: @closet.subcategory_id, usage_frequency: @closet.usage_frequency } }
    assert_redirected_to closet_url(@closet)
  end

  test "should destroy closet" do
    assert_difference("Closet.count", -1) do
      delete closet_url(@closet)
    end

    assert_redirected_to closets_url
  end
end
