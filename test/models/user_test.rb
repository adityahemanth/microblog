require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  # setting up the instance variable @user
  # this var will be available to all the 
  # other methods here. 
  def setup
  	@user = User.new(name: 'John Doe', email: 'jdoe@gmail.com', password: 'testpwd')
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = ''
  	assert_not @user.valid?
  	@user.name = 'John Doe'
  end

  test "email should be present" do
  	@user.email = ''
  	assert_not @user.valid?
  	@user.email = 'jdoe@gmail.com'
  end

  test "should allow valid emails to be saved" do 
  	assert @user.save
  	@user.destroy
  end

  test "email should be valid" do
  	@user.email = 'lakd'
  	assert_not @user.valid?
  	@user.email = 'jdoe@gmail.com'
  end

  test "email should be unique" do
  	dup_user = @user.dup
  	@user.save
  	assert_not dup_user.valid?
  	@user.destroy
  end

  test "email should not be case sensitive" do
  	dup_user = @user.dup
  	dup_user.email = @user.email.upcase
  	@user.save
  	assert_not dup_user.valid?
  end

  test 'email should be saved in downcase' do
    MIXED_CASE_EMAIL = 'JohnDOE@gmAIl.com'
    @user.email = MIXED_CASE_EMAIL
    @user.save
    assert_equal MIXED_CASE_EMAIL.downcase, @user.reload.email
  end

end
