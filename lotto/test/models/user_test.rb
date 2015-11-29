require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup 
    @user = User.new(username: "Example User", password: "password", email: "exap@user.com")
  end
  
  test "should be valid" do
    assert @user.valid?
  end
  
  test "should not be present" do
    @user.username = "  "
    assert_not @user.valid?
  end
  
  test "should be username lenght between 4 to 20" do
    @user.username = "a" * 3
    assert_not @user.valid?
    @user.username = "a" * 21
    assert_not @user.valid?
  end
  
  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end
  
  test "email should not be too long" do
    @user.email = "a"*256
    assert_not @user.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
    valid_addresses.each do |va|
      @user.email = va
      assert @user.valid?, "#{va.inspect} should be valid"
    end
  end
  
  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |ia|
      @user.email = ia
      assert_not @user.valid?, "#{ia.inspect} should be invalid"
    end
  end
  
  test "email address should be unique" do
    dup_user = @user.dup
    dup_user.email = @user.email.upcase
    @user.save
    assert_not dup_user.valid?
  end
  
  
end
