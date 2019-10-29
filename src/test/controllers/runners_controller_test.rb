require 'test_helper'

class RunnersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get runners_index_url
    assert_response :success
  end

  test "should get show" do
    get runners_show_url
    assert_response :success
  end

  test "should get new" do
    get runners_new_url
    assert_response :success
  end

  test "should get edit" do
    get runners_edit_url
    assert_response :success
  end

  test "should get delete" do
    get runners_delete_url
    assert_response :success
  end

end
