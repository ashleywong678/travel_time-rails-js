require 'test_helper'

class AgenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get agencies_show_url
    assert_response :success
  end

  test "should get new" do
    get agencies_new_url
    assert_response :success
  end

  test "should get create" do
    get agencies_create_url
    assert_response :success
  end

  test "should get edit" do
    get agencies_edit_url
    assert_response :success
  end

  test "should get update" do
    get agencies_update_url
    assert_response :success
  end

end
