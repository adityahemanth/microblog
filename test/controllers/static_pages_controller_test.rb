require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get root" do
  	get root_url
  	assert_response :success
  end

  test "should get home" do
    get home_url
    assert_response :success
    assert_select "title", "Home | MB"
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help | MB"
  end

  test "should get about" do
  	get about_url
  	assert_response :success
  	assert_select "title", "About | MB"
  end

end
