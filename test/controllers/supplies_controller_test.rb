require "test_helper"

class SuppliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get supplies_index_url
    assert_response :success
  end

  test "should get show" do
    get supplies_show_url
    assert_response :success
  end

  test "should get new" do
    get supplies_new_url
    assert_response :success
  end

  test "should get create" do
    get supplies_create_url
    assert_response :success
  end

  test "should get edit" do
    get supplies_edit_url
    assert_response :success
  end

  test "should get update" do
    get supplies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get supplies_destroy_url
    assert_response :success
  end
end
