require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "user should not save without valid username" do
  	user = User.new
  	assert_not user.save
  end
end
