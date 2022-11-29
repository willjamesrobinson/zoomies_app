require "test_helper"

class DoggyDateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get doggy_date_index_url
    assert_response :success
  end

  test "should get show" do
    get doggy_date_show_url
    assert_response :success
  end

  test "should get new" do
    get doggy_date_new_url
    assert_response :success
  end

  test "should get edit" do
    get doggy_date_edit_url
    assert_response :success
  end
end
