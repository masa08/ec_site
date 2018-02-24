require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get confimation" do
    get purchases_confimation_url
    assert_response :success
  end

  test "should get complete" do
    get purchases_complete_url
    assert_response :success
  end

  test "should get purchase_info" do
    get purchases_purchase_info_url
    assert_response :success
  end

end
