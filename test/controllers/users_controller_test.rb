require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_edit_url
    assert_response :success
  end

  test "should get history_show" do
    get users_history_show_url
    assert_response :success
  end

  test "should get goodbye_confirmation" do
    get users_goodbye_confirmation_url
    assert_response :success
  end

end
