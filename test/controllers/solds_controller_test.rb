require 'test_helper'

class SoldsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sold = solds(:one)
  end

  test "should get index" do
    get solds_url
    assert_response :success
  end

  test "should get new" do
    get new_sold_url
    assert_response :success
  end

  test "should create sold" do
    assert_difference('Sold.count') do
      post solds_url, params: { sold: { company_part_id: @sold.company_part_id, member_id: @sold.member_id, price_cents: @sold.price_cents, promotion: @sold.promotion, quantity: @sold.quantity, status: @sold.status } }
    end

    assert_redirected_to sold_url(Sold.last)
  end

  test "should show sold" do
    get sold_url(@sold)
    assert_response :success
  end

  test "should get edit" do
    get edit_sold_url(@sold)
    assert_response :success
  end

  test "should update sold" do
    patch sold_url(@sold), params: { sold: { company_part_id: @sold.company_part_id, member_id: @sold.member_id, price_cents: @sold.price_cents, promotion: @sold.promotion, quantity: @sold.quantity, status: @sold.status } }
    assert_redirected_to sold_url(@sold)
  end

  test "should destroy sold" do
    assert_difference('Sold.count', -1) do
      delete sold_url(@sold)
    end

    assert_redirected_to solds_url
  end
end
