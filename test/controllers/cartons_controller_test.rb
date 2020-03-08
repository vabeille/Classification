require 'test_helper'

class CartonsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cartons_index_url
    assert_response :success
  end

  test "should get show" do
    get cartons_show_url
    assert_response :success
  end

  test "should get new" do
    get cartons_new_url
    assert_response :success
  end

  test "should get create" do
    get cartons_create_url
    assert_response :success
  end

  test "should get edit" do
    get cartons_edit_url
    assert_response :success
  end

  test "should get update" do
    get cartons_update_url
    assert_response :success
  end

  test "should get destroy" do
    get cartons_destroy_url
    assert_response :success
  end

end
