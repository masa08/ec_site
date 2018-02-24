require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_index_url
    assert_response :success
  end

  test "should get user" do
    get admins_user_url
    assert_response :success
  end

  test "should get histories_index" do
    get admins_histories_index_url
    assert_response :success
  end

end
