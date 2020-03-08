require 'test_helper'

class DossiersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get dossiers_new_url
    assert_response :success
  end

  test "should get create" do
    get dossiers_create_url
    assert_response :success
  end

  test "should get edit" do
    get dossiers_edit_url
    assert_response :success
  end

  test "should get update" do
    get dossiers_update_url
    assert_response :success
  end

  test "should get destroy" do
    get dossiers_destroy_url
    assert_response :success
  end

end
