require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login with bad info" do
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, session:{email: "", password: ""}
  	assert_redirected_to login_path
  	assert_not flash.empty?
  end

  test "login with good info" do 
  	get login_path
  	assert_template 'sessions/new'
  	post login_path, session:{email: "MyString", password: "MyString"}
  	assert_redirected_to login_path
  end
end
