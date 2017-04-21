require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.create(name: 'johndoe', email: 'johndoe@gmail.com', password: 'testpwd')
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "invalid signup information" do
    NEW_EMAIL = 'johndoe@gmail.com'
    PASSWORD = 'testpwd'
    get signup_path
    assert_no_difference('User.count') do
      post users_url, params: { user: { email: NEW_EMAIL, name: @user.name, password: PASSWORD, password_confirmation: '' } }
    end
  end

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

  test "should update user" do
    patch user_url(@user), params: { user: { email: @user.email, name: @user.name } }
    assert_redirected_to user_url(@user)
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
